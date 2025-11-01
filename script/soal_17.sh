SCRIPT (Gilgalad)
#!/bin/bash
# soal17-benchmark-failover.sh
# Testing benchmark dan failover Pharazon

set -e

echo "=============================================="
echo "  SOAL 17: BENCHMARK & FAILOVER TEST"
echo "=============================================="
echo ""

# Install Apache Benchmark jika belum ada
if ! command -v ab &> /dev/null; then
    echo "Installing Apache Benchmark..."
    apt-get update -qq
    apt-get install -y apache2-utils
    echo ""
fi

# Fungsi untuk menjalankan benchmark
run_benchmark() {
    local TEST_NAME="$1"
    local N_REQUESTS="$2"
    local CONCURRENCY="$3"
    local OUTPUT_FILE="/tmp/ab-pharazon-${TEST_NAME}.txt"
    
    echo "=============================================="
    echo "  $TEST_NAME"
    echo "  Requests: $N_REQUESTS | Concurrency: $CONCURRENCY"
    echo "=============================================="
    echo ""
    
    # Jalankan Apache Benchmark dengan Basic Auth
    ab -n $N_REQUESTS -c $CONCURRENCY \
       -A noldor:silvan \
       http://pharazon.k02.com/ 2>&1 | tee $OUTPUT_FILE
    
    echo ""
    echo "Ringkasan Hasil:"
    echo "----------------------------------------"
    grep "Time taken\|Requests per second\|Time per request\|Failed requests" $OUTPUT_FILE | head -4
    echo "----------------------------------------"
    echo ""
    
    return 0
}

# Fungsi untuk cek status worker
check_workers() {
    echo "=============================================="
    echo "  Status Worker Nodes"
    echo "=============================================="
    
    for WORKER in "galadriel.k02.com:8004" "celeborn.k02.com:8005" "oropher.k02.com:8006"; do
        echo -n "  $WORKER: "
        STATUS=$(curl -s -o /dev/null -w "%{http_code}" -u noldor:silvan http://$WORKER/ 2>/dev/null)
        if [ "$STATUS" == "200" ]; then
            echo "✓ UP (HTTP $STATUS)"
        else
            echo "✗ DOWN (HTTP $STATUS)"
        fi
    done
    echo ""
}

# Fungsi untuk cek distribusi dari sample requests
check_distribution() {
    local N_SAMPLES=${1:-20}
    echo "=============================================="
    echo "  Distribusi Request (Sample: $N_SAMPLES)"
    echo "=============================================="
    
    declare -A count
    count[Galadriel]=0
    count[Celeborn]=0
    count[Oropher]=0
    count[Unknown]=0
    
    for i in $(seq 1 $N_SAMPLES); do
        RESPONSE=$(curl -s -u noldor:silvan http://pharazon.k02.com/ 2>&1)
        
        if echo "$RESPONSE" | grep -q "Server:.*Galadriel"; then
            count[Galadriel]=$((${count[Galadriel]} + 1))
        elif echo "$RESPONSE" | grep -q "Server:.*Celeborn"; then
            count[Celeborn]=$((${count[Celeborn]} + 1))
        elif echo "$RESPONSE" | grep -q "Server:.*Oropher"; then
            count[Oropher]=$((${count[Oropher]} + 1))
        else
            count[Unknown]=$((${count[Unknown]} + 1))
        fi
        
        # Progress indicator
        if [ $((i % 5)) -eq 0 ]; then
            echo -n "."
        fi
    done
    
    echo ""
    echo ""
    echo "Hasil Distribusi:"
    echo "  🌸 Galadriel: ${count[Galadriel]} requests ($(( ${count[Galadriel]} * 100 / N_SAMPLES ))%)"
    echo "  🌺 Celeborn:  ${count[Celeborn]} requests ($(( ${count[Celeborn]} * 100 / N_SAMPLES ))%)"
    echo "  🌻 Oropher:   ${count[Oropher]} requests ($(( ${count[Oropher]} * 100 / N_SAMPLES ))%)"
    
    if [ ${count[Unknown]} -gt 0 ]; then
        echo "  ❓ Unknown:   ${count[Unknown]} requests"
    fi
    echo ""
}

# ============================================
# BAGIAN 1: BENCHMARK DENGAN SEMUA WORKER UP
# ============================================

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║  BAGIAN 1: SEMUA WORKER AKTIF             ║"
echo "╚════════════════════════════════════════════╝"
echo ""

check_workers
check_distribution 30

# Benchmark 1: Test ringan
run_benchmark "TEST-1-RINGAN" 100 10

sleep 2

# Benchmark 2: Test sedang
run_benchmark "TEST-2-SEDANG" 1000 50

sleep 2

# Benchmark 3: Test berat
run_benchmark "TEST-3-BERAT" 2000 100

echo ""
echo "=============================================="
echo "  ✅ BAGIAN 1 SELESAI"
echo "=============================================="
echo ""
read -p "Tekan ENTER setelah Anda menjalankan 'service nginx stop' di Galadriel..."

# ============================================
# BAGIAN 2: BENCHMARK SETELAH 1 WORKER DOWN
# ============================================

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║  BAGIAN 2: GALADRIEL DOWN (FAILOVER TEST) ║"
echo "╚════════════════════════════════════════════╝"
echo ""

check_workers
check_distribution 30

# Benchmark 4: Test dengan 1 worker down
run_benchmark "TEST-4-FAILOVER" 1000 50

sleep 2

# Benchmark 5: Test berat dengan 1 worker down
run_benchmark "TEST-5-FAILOVER-BERAT" 2000 100

echo ""
echo "=============================================="
echo "  ✅ BAGIAN 2 SELESAI"
echo "=============================================="
echo ""
read -p "Tekan ENTER setelah Anda menjalankan 'service nginx start' di Galadriel..."

# ============================================
# BAGIAN 3: RECOVERY TEST
# ============================================

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║  BAGIAN 3: RECOVERY (SEMUA UP LAGI)       ║"
echo "╚════════════════════════════════════════════╝"
echo ""

check_workers
check_distribution 30

# Benchmark 6: Test setelah recovery
run_benchmark "TEST-6-RECOVERY" 1000 50

echo ""
echo "=============================================="
echo "  📊 RINGKASAN SEMUA TEST"
echo "=============================================="
echo ""

for TEST in "TEST-1-RINGAN" "TEST-2-SEDANG" "TEST-3-BERAT" "TEST-4-FAILOVER" "TEST-5-FAILOVER-BERAT" "TEST-6-RECOVERY"; do
    if [ -f "/tmp/ab-pharazon-${TEST}.txt" ]; then
        echo "$TEST:"
        grep "Requests per second\|Failed requests" /tmp/ab-pharazon-${TEST}.txt | head -2
        echo ""
    fi
done

echo "=============================================="
echo "  ✅ SEMUA TEST SELESAI"
echo "=============================================="
echo ""
echo "File hasil benchmark tersimpan di:"
ls -lh /tmp/ab-pharazon-*.txt 2>/dev/null
echo ""
echo "Untuk melihat log Pharazon, jalankan di node Pharazon:"
echo "  bash check-pharazon-logs.sh"
echo "=============================================="
SCRIPT (Log Pharazon)
#!/bin/bash
# check-pharazon-logs.sh
# Jalankan di PHARAZON untuk analisis log

echo "=============================================="
echo "  PHARAZON - LOG ANALYSIS (SOAL 17)"
echo "=============================================="
echo ""

LOG_FILE="/var/log/nginx/pharazon-access.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "✗ Log file tidak ditemukan: $LOG_FILE"
    exit 1
fi

# 1. Total requests
echo "[1] Total Requests:"
echo "----------------------------------------"
TOTAL=$(wc -l < $LOG_FILE)
echo "  Total: $TOTAL requests"
echo ""

# 2. Distribusi per worker (semua waktu)
echo "[2] Distribusi Request per Worker (ALL TIME):"
echo "----------------------------------------"
grep -oE 'upstream: [^:]+:[0-9]+' $LOG_FILE | \
    awk '{print $2}' | \
    sort | uniq -c | \
    awk '
    {
        count=$1
        server=$2
        total+=$1
        if (server ~ /8004/) { worker="Galadriel:8004"; gal=$1 }
        else if (server ~ /8005/) { worker="Celeborn:8005"; cel=$1 }
        else if (server ~ /8006/) { worker="Oropher:8006"; oro=$1 }
        else worker=server
        printf "  %-20s: %5d requests\n", worker, count
    }
    END {
        if (total > 0) {
            printf "\n  Total distributed: %d requests\n", total
            if (gal > 0) printf "  Galadriel: %.1f%%\n", (gal/total)*100
            if (cel > 0) printf "  Celeborn:  %.1f%%\n", (cel/total)*100
            if (oro > 0) printf "  Oropher:   %.1f%%\n", (oro/total)*100
        }
    }
    '
echo "----------------------------------------"
echo ""

# 3. Last 100 requests distribution
echo "[3] Distribusi Request (Last 100):"
echo "----------------------------------------"
tail -100 $LOG_FILE | \
    grep -oE 'upstream: [^:]+:[0-9]+' | \
    awk '{print $2}' | \
    sort | uniq -c | \
    awk '
    {
        count=$1
        server=$2
        if (server ~ /8004/) worker="Galadriel:8004"
        else if (server ~ /8005/) worker="Celeborn:8005"
        else if (server ~ /8006/) worker="Oropher:8006"
        else worker=server
        printf "  %-20s: %3d requests\n", worker, count
    }
    '
echo "----------------------------------------"
echo ""

# 4. Status code distribution
echo "[4] HTTP Status Code Distribution:"
echo "----------------------------------------"
awk '{print $9}' $LOG_FILE | \
    sort | uniq -c | \
    awk '{printf "  HTTP %s: %5d requests\n", $2, $1}'
echo "----------------------------------------"
echo ""

# 5. Failed upstream connections (502, 503, 504)
echo "[5] Failed Upstream Connections:"
echo "----------------------------------------"
FAILED=$(grep -E ' (502|503|504) ' $LOG_FILE | wc -l)
if [ $FAILED -gt 0 ]; then
    echo "  ⚠ Failed requests: $FAILED"
    echo ""
    echo "  Last 10 failed requests:"
    grep -E ' (502|503|504) ' $LOG_FILE | tail -10 | \
        awk '{print "    " $4, $9, $7}'
else
    echo "  ✓ No failed upstream connections"
fi
echo "----------------------------------------"
echo ""

# 6. Timeline - requests per minute (last hour)
echo "[6] Timeline - Requests Pattern:"
echo "----------------------------------------"
echo "  Last 10 entries:"
tail -10 $LOG_FILE | \
    awk '{
        time=$4
        gsub(/\[/, "", time)
        split(time, t, ":")
        printf "    %s:%s - %s %s\n", t[2], t[3], $9, $7
    }'
echo "----------------------------------------"
echo ""

# 7. Detect failover events (consecutive 502/503 to same upstream)
echo "[7] Failover Events Detection:"
echo "----------------------------------------"
grep -E ' (502|503|504) ' $LOG_FILE | \
    grep -oE 'upstream: [^:]+:[0-9]+' | \
    uniq -c | \
    awk '
    $1 > 5 {
        server=$3
        if (server ~ /8004/) worker="Galadriel"
        else if (server ~ /8005/) worker="Celeborn"
        else if (server ~ /8006/) worker="Oropher"
        else worker=server
        printf "  ⚠ Possible failover detected: %s (%d consecutive failures)\n", worker, $1
    }
    ' || echo "  ✓ No significant failover events detected"
echo "----------------------------------------"
echo ""

echo "=============================================="
echo "  ✅ LOG ANALYSIS COMPLETE"
echo "=============================================="
echo ""
echo "Key findings:"
echo "  - Total requests: $TOTAL"
echo "  - Failed requests: $FAILED"
echo ""
echo "Recommendations:"
echo "  - Check if distribution is balanced (33% each when all up)"
echo "  - Check if failover happened smoothly (502/503 minimal)"
echo "  - Verify recovery after worker restart"
echo "=============================================="
image