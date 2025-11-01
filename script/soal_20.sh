SCRIPT (Pharazon)
#!/bin/bash
# soal20-pharazon-caching.sh
# Setup Nginx Caching di Pharazon

set -e

echo "=============================================="
echo "  SOAL 20: NGINX CACHING - PHARAZON"
echo "=============================================="
echo ""

# Backup config lama
if [ -f /etc/nginx/sites-available/pharazon-lb ]; then
    cp /etc/nginx/sites-available/pharazon-lb /etc/nginx/sites-available/pharazon-lb.backup-soal20
    echo "✓ Backup config dibuat"
fi

# Buat direktori cache
echo "Membuat direktori cache..."
mkdir -p /var/cache/nginx/pharazon
chown -R www-data:www-data /var/cache/nginx/pharazon
chmod -R 755 /var/cache/nginx/pharazon
echo "✓ Direktori cache dibuat"
echo ""

# Buat konfigurasi dengan Caching
cat > /etc/nginx/sites-available/pharazon-lb << 'EOF'
# Cache Configuration
proxy_cache_path /var/cache/nginx/pharazon 
                 levels=1:2 
                 keys_zone=pharazon_cache:10m 
                 max_size=100m 
                 inactive=60m 
                 use_temp_path=off;

# Rate Limiting Zone - 10 req/s per IP
limit_req_zone $binary_remote_addr zone=limit_pharazon:10m rate=10r/s;
limit_req_status 429;

# Upstream definition untuk Round Robin
upstream Kesatria_Lorien {
    server galadriel.k02.com:8004;
    server celeborn.k02.com:8005;
    server oropher.k02.com:8006;
}

# Log format untuk tracking cache status
log_format pharazon_cache '$remote_addr - $remote_user [$time_local] '
                          '"$request" $status $body_bytes_sent '
                          '"$http_referer" "$http_user_agent" '
                          'upstream: $upstream_addr '
                          'cache: $upstream_cache_status '
                          'rt: $request_time';

# Blokir akses via IP
server {
    listen 80 default_server;
    server_name ~^[0-9.]+$;
    return 444;
}

# Server block untuk pharazon.k02.com
server {
    listen 80;
    server_name pharazon.k02.com;
    
    access_log /var/log/nginx/pharazon-access.log pharazon_cache;
    error_log /var/log/nginx/pharazon-error.log;

    location / {
        # Rate Limiting
        limit_req zone=limit_pharazon burst=20 delay=10;
        
        # Cache Configuration
        proxy_cache pharazon_cache;
        proxy_cache_valid 200 60m;
        proxy_cache_valid 404 10m;
        proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
        proxy_cache_background_update on;
        proxy_cache_lock on;
        
        # Add cache status to response header
        add_header X-Cache-Status $upstream_cache_status;
        add_header X-Proxy-Cache "Pharazon";
        
        # Proxy to upstream
        proxy_pass http://Kesatria_Lorien;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Authorization $http_authorization;
        proxy_pass_header Authorization;
        
        # Timeout settings
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
        
        # Buffer settings
        proxy_buffering on;
        proxy_buffer_size 4k;
        proxy_buffers 8 4k;
    }
    
    # Cache purge endpoint (optional, untuk testing)
    location ~ /purge(/.*) {
        allow 127.0.0.1;
        allow 192.212.0.0/16;
        deny all;
        proxy_cache_purge pharazon_cache "$scheme$request_method$host$1";
    }
}
EOF

echo "✓ Konfigurasi Caching dibuat"
echo ""

# Test config
echo "Testing nginx configuration..."
nginx -t

if [ $? -eq 0 ]; then
    echo ""
    echo "Restarting nginx..."
    service nginx stop 2>/dev/null || true
    sleep 2
    service nginx start
    sleep 2
    
    if ps aux | grep -q "[n]ginx: master"; then
        echo "✓ Nginx berhasil direstart"
    else
        echo "✗ Nginx gagal restart"
        exit 1
    fi
else
    echo "✗ Nginx config error"
    exit 1
fi

echo ""
echo "=============================================="
echo "  ✅ NGINX CACHING AKTIF - PHARAZON"
echo "=============================================="
echo ""
echo "Cache Configuration:"
echo "  - Cache Path: /var/cache/nginx/pharazon"
echo "  - Cache Zone: pharazon_cache (10MB)"
echo "  - Max Size: 100MB"
echo "  - Valid Time: 60 minutes (200 OK)"
echo "  - Cache Status Header: X-Cache-Status"
echo ""
echo "Cache Status Values:"
echo "  - MISS: Request tidak ada di cache, diambil dari backend"
echo "  - HIT: Request diambil dari cache"
echo "  - EXPIRED: Cache expired, refresh dari backend"
echo "  - STALE: Cache stale tapi masih digunakan"
echo "  - UPDATING: Cache sedang diupdate"
echo "  - BYPASS: Cache diabaikan"
echo ""
echo "Testing dari client:"
echo "  # Request pertama (expect MISS)"
echo "  curl -I -u noldor:silvan http://pharazon.k02.com/"
echo ""
echo "  # Request kedua (expect HIT)"
echo "  curl -I -u noldor:silvan http://pharazon.k02.com/"
echo ""
echo "  # Lihat cache status di header X-Cache-Status"
echo ""
echo "Monitoring cache:"
echo "  tail -f /var/log/nginx/pharazon-access.log"
echo "  du -sh /var/cache/nginx/pharazon/"
echo "=============================================="
SCRIPT TESTING Client (Gilgalad)
#!/bin/bash
# soal20-test-cache.sh
# Testing Nginx Cache dari Client

set -e

echo "=============================================="
echo "  SOAL 20: TESTING NGINX CACHE"
echo "=============================================="
echo ""

URL="http://pharazon.k02.com/"
AUTH="-u noldor:silvan"

echo "Target: $URL"
echo ""

# Test 1: First Request (MISS)
echo "╔════════════════════════════════════════════╗"
echo "║  TEST 1: First Request (Expect MISS)      ║"
echo "╚════════════════════════════════════════════╝"
echo ""
echo "Sending first request..."
RESPONSE=$(curl -s -I $AUTH $URL 2>&1)
CACHE_STATUS=$(echo "$RESPONSE" | grep -i "X-Cache-Status" | cut -d: -f2 | tr -d ' \r')
HTTP_CODE=$(echo "$RESPONSE" | grep "HTTP" | awk '{print $2}')

echo "Response Headers:"
echo "$RESPONSE" | grep -E "HTTP|X-Cache-Status|X-Proxy-Cache"
echo ""
echo "Result:"
echo "  HTTP Code: $HTTP_CODE"
echo "  Cache Status: $CACHE_STATUS"
echo ""

if [ "$CACHE_STATUS" == "MISS" ]; then
    echo "✓ CORRECT: Cache MISS (request pertama)"
else
    echo "⚠ Cache Status: $CACHE_STATUS (expected MISS)"
fi
echo ""
sleep 2

# Test 2: Second Request (HIT)
echo "╔════════════════════════════════════════════╗"
echo "║  TEST 2: Second Request (Expect HIT)      ║"
echo "╚════════════════════════════════════════════╝"
echo ""
echo "Sending second request..."
RESPONSE=$(curl -s -I $AUTH $URL 2>&1)
CACHE_STATUS=$(echo "$RESPONSE" | grep -i "X-Cache-Status" | cut -d: -f2 | tr -d ' \r')
HTTP_CODE=$(echo "$RESPONSE" | grep "HTTP" | awk '{print $2}')

echo "Response Headers:"
echo "$RESPONSE" | grep -E "HTTP|X-Cache-Status|X-Proxy-Cache"
echo ""
echo "Result:"
echo "  HTTP Code: $HTTP_CODE"
echo "  Cache Status: $CACHE_STATUS"
echo ""

if [ "$CACHE_STATUS" == "HIT" ]; then
    echo "✓ CORRECT: Cache HIT (dari cache)"
else
    echo "⚠ Cache Status: $CACHE_STATUS (expected HIT)"
fi
echo ""
sleep 2

# Test 3: Multiple Requests
echo "╔════════════════════════════════════════════╗"
echo "║  TEST 3: Multiple Requests (10x)          ║"
echo "╚════════════════════════════════════════════╝"
echo ""

declare -A cache_count
cache_count[HIT]=0
cache_count[MISS]=0
cache_count[OTHER]=0

for i in {1..10}; do
    RESPONSE=$(curl -s -I $AUTH $URL 2>&1)
    CACHE_STATUS=$(echo "$RESPONSE" | grep -i "X-Cache-Status" | cut -d: -f2 | tr -d ' \r')
    
    if [ "$CACHE_STATUS" == "HIT" ]; then
        cache_count[HIT]=$((${cache_count[HIT]} + 1))
        echo "Request #$i: HIT ✓"
    elif [ "$CACHE_STATUS" == "MISS" ]; then
        cache_count[MISS]=$((${cache_count[MISS]} + 1))
        echo "Request #$i: MISS"
    else
        cache_count[OTHER]=$((${cache_count[OTHER]} + 1))
        echo "Request #$i: $CACHE_STATUS"
    fi
    
    sleep 0.2
done

echo ""
echo "Summary:"
echo "  HIT:   ${cache_count[HIT]} requests (dari cache)"
echo "  MISS:  ${cache_count[MISS]} requests (dari backend)"
echo "  OTHER: ${cache_count[OTHER]} requests"
echo ""

if [ ${cache_count[HIT]} -ge 8 ]; then
    echo "✓ Cache berfungsi dengan baik (≥80% HIT)"
else
    echo "⚠ Cache kurang optimal (<80% HIT)"
fi
echo ""

# Test 4: Performance Comparison
echo "╔════════════════════════════════════════════╗"
echo "║  TEST 4: Performance Comparison           ║"
echo "╚════════════════════════════════════════════╝"
echo ""

echo "Measuring response time..."
echo ""

# Request ke backend langsung (jika ada)
echo "Direct to Worker (Galadriel):"
TIME_DIRECT=$(curl -o /dev/null -s -w '%{time_total}' $AUTH http://galadriel.k02.com:8004/ 2>/dev/null || echo "N/A")
echo "  Response Time: ${TIME_DIRECT}s"
echo ""

# Request via cache (HIT)
echo "Via Cache (Pharazon - HIT):"
TIME_CACHE=$(curl -o /dev/null -s -w '%{time_total}' $AUTH $URL 2>/dev/null)
echo "  Response Time: ${TIME_CACHE}s"
echo ""

if [ "$TIME_DIRECT" != "N/A" ]; then
    echo "Performance Improvement:"
    python3 -c "print(f'  Cache is {float($TIME_DIRECT) / float($TIME_CACHE):.2f}x faster')" 2>/dev/null || echo "  Unable to calculate"
fi
echo ""

echo "=============================================="
echo "  ✅ TESTING SELESAI"
echo "=============================================="
echo ""
echo "Kesimpulan:"
echo "  - Request pertama: MISS (ambil dari backend)"
echo "  - Request berikutnya: HIT (dari cache)"
echo "  - Cache mengurangi beban pada worker PHP"
echo ""
echo "Melihat statistik cache di Pharazon:"
echo "  bash soal20-cache-stats.sh"
echo "=============================================="
Pharazon (Monitoring Cache Statistics)
#!/bin/bash
# soal20-cache-stats.sh
# Monitoring Cache Statistics di Pharazon

echo "=============================================="
echo "  CACHE STATISTICS - PHARAZON"
echo "=============================================="
echo ""

LOG_FILE="/var/log/nginx/pharazon-access.log"
CACHE_DIR="/var/cache/nginx/pharazon"

if [ ! -f "$LOG_FILE" ]; then
    echo "✗ Log file tidak ditemukan: $LOG_FILE"
    exit 1
fi

# 1. Cache Directory Size
echo "[1] Cache Storage:"
echo "----------------------------------------"
if [ -d "$CACHE_DIR" ]; then
    CACHE_SIZE=$(du -sh $CACHE_DIR | awk '{print $1}')
    CACHE_FILES=$(find $CACHE_DIR -type f | wc -l)
    echo "  Location: $CACHE_DIR"
    echo "  Size: $CACHE_SIZE"
    echo "  Files: $CACHE_FILES cached items"
else
    echo "  ⚠ Cache directory tidak ditemukan"
fi
echo "----------------------------------------"
echo ""

# 2. Cache Status Distribution
echo "[2] Cache Status Distribution:"
echo "----------------------------------------"
grep -oE 'cache: [A-Z]+' $LOG_FILE | \
    awk '{print $2}' | \
    sort | uniq -c | sort -rn | \
    awk '
    {
        count=$1
        status=$2
        total+=$1
        if (status=="HIT") hit=$1
        else if (status=="MISS") miss=$1
        else if (status=="EXPIRED") expired=$1
        printf "  %-10s: %5d requests\n", status, count
    }
    END {
        if (total > 0) {
            printf "\n  Total: %d requests\n", total
            if (hit > 0) printf "  Hit Ratio: %.1f%%\n", (hit/total)*100
            if (miss > 0) printf "  Miss Ratio: %.1f%%\n", (miss/total)*100
        }
    }
    '
echo "----------------------------------------"
echo ""

# 3. Recent Cache Activity
echo "[3] Recent Cache Activity (Last 20 requests):"
echo "----------------------------------------"
tail -20 $LOG_FILE | \
    grep -oE '"[^"]+" [0-9]+ [0-9]+ .* cache: [A-Z]+' | \
    awk '{
        request=$1" "$2" "$3
        cache=$NF
        printf "  %-40s → %s\n", request, cache
    }'
echo "----------------------------------------"
echo ""

# 4. Cache Performance
echo "[4] Cache Performance (Response Time):"
echo "----------------------------------------"
echo "Average response time by cache status:"
grep 'cache:' $LOG_FILE | \
    awk '{
        match($0, /cache: ([A-Z]+)/, cache)
        match($0, /rt: ([0-9.]+)/, rt)
        if (cache[1] && rt[1]) {
            sum[cache[1]] += rt[1]
            count[cache[1]]++
        }
    }
    END {
        for (status in sum) {
            printf "  %-10s: %.3fs (avg from %d requests)\n", 
                   status, sum[status]/count[status], count[status]
        }
    }
    ' 2>/dev/null || echo "  (Insufficient data)"
echo "----------------------------------------"
echo ""

# 5. Top Cached URLs
echo "[5] Top Cached URLs:"
echo "----------------------------------------"
grep 'cache: HIT' $LOG_FILE | \
    awk '{print $7}' | \
    sort | uniq -c | sort -rn | head -10 | \
    awk '{printf "  %3d hits: %s\n", $1, $2}'
echo "----------------------------------------"
echo ""

# 6. Cache Over Time
echo "[6] Cache Hits Over Time (Last Hour):"
echo "----------------------------------------"
grep 'cache: HIT' $LOG_FILE | \
    tail -100 | \
    awk '{
        time=$4
        gsub(/\[/, "", time)
        split(time, t, ":")
        printf "  %s:%s - HIT\n", t[2], t[3]
    }' | uniq -c | tail -10 | \
    awk '{printf "  %s: %d hits\n", $2, $1}'
echo "----------------------------------------"
echo ""

echo "=============================================="
echo "  ✅ CACHE MONITORING COMPLETE"
echo "=============================================="
echo ""
echo "Summary:"
TOTAL_REQUESTS=$(wc -l < $LOG_FILE)
HIT_COUNT=$(grep -c 'cache: HIT' $LOG_FILE 2>/dev/null || echo 0)
HIT_RATIO=$(python3 -c "print(f'{($HIT_COUNT/$TOTAL_REQUESTS)*100:.1f}')" 2>/dev/null || echo "N/A")

echo "  Total Requests: $TOTAL_REQUESTS"
echo "  Cache Hits: $HIT_COUNT"
echo "  Hit Ratio: ${HIT_RATIO}%"
echo ""
echo "Cache is working if:"
echo "  ✓ Hit Ratio > 50% after warmup"
echo "  ✓ Response time for HIT < MISS"
echo "  ✓ Cache files exist in $CACHE_DIR"
echo "=============================================="