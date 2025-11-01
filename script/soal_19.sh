Elros
#!/bin/bash
# soal19-elros-rate-limit.sh
# Setup Rate Limiting di Elros

set -e

echo "=============================================="
echo "  SOAL 19: RATE LIMITING - ELROS"
echo "=============================================="
echo ""

# Backup config lama
if [ -f /etc/nginx/sites-available/elros-lb ]; then
    cp /etc/nginx/sites-available/elros-lb /etc/nginx/sites-available/elros-lb.backup-soal19
    echo "✓ Backup config dibuat"
fi

# Buat konfigurasi dengan Rate Limiting
cat > /etc/nginx/sites-available/elros-lb << 'EOF'
# Rate Limiting Zone - 10 req/s per IP
limit_req_zone $binary_remote_addr zone=limit_elros:10m rate=10r/s;
limit_req_status 429;

# Upstream definition untuk Round Robin
upstream kesatria_numenor {
    server elendil.k02.com:8001;
    server isildur.k02.com:8002;
    server anarion.k02.com:8003;
}

# Log format untuk tracking
log_format elros_limit '$remote_addr - $remote_user [$time_local] '
                       '"$request" $status $body_bytes_sent '
                       '"$http_referer" "$http_user_agent" '
                       'upstream: $upstream_addr '
                       'request_time: $request_time '
                       'limit_status: $limit_req_status';

# Blokir akses via IP
server {
    listen 80 default_server;
    server_name ~^[0-9.]+$;
    return 444;
}

# Server block untuk elros.k02.com
server {
    listen 80;
    server_name elros.k02.com;
    
    access_log /var/log/nginx/elros-access.log elros_limit;
    error_log /var/log/nginx/elros-error.log;

    location / {
        # RATE LIMITING: 10 req/s, burst 20, delay after 10
        limit_req zone=limit_elros burst=20 delay=10;
        
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }
}
EOF

echo "✓ Konfigurasi Rate Limiting dibuat"
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
echo "  ✅ RATE LIMITING AKTIF - ELROS"
echo "=============================================="
echo ""
echo "Rate Limit Configuration:"
echo "  - Zone: limit_elros"
echo "  - Rate: 10 requests/second"
echo "  - Burst: 20 requests"
echo "  - Delay: after 10 requests"
echo "  - Status code: 429 (Too Many Requests)"
echo ""
echo "Testing dari client:"
echo "  ab -n 200 -c 50 http://elros.k02.com/api/airing"
echo ""
echo "Monitoring rate limit:"
echo "  tail -f /var/log/nginx/elros-error.log | grep limiting"
echo "  tail -f /var/log/nginx/elros-access.log | grep 429"
echo "=============================================="
Pharazon
#!/bin/bash
# soal19-pharazon-rate-limit.sh
# Setup Rate Limiting di Pharazon

set -e

echo "=============================================="
echo "  SOAL 19: RATE LIMITING - PHARAZON"
echo "=============================================="
echo ""

# Backup config lama
if [ -f /etc/nginx/sites-available/pharazon-lb ]; then
    cp /etc/nginx/sites-available/pharazon-lb /etc/nginx/sites-available/pharazon-lb.backup-soal19
    echo "✓ Backup config dibuat"
fi

# Buat konfigurasi dengan Rate Limiting
cat > /etc/nginx/sites-available/pharazon-lb << 'EOF'
# Rate Limiting Zone - 10 req/s per IP
limit_req_zone $binary_remote_addr zone=limit_pharazon:10m rate=10r/s;
limit_req_status 429;

# Upstream definition untuk Round Robin
upstream Kesatria_Lorien {
    server galadriel.k02.com:8004;
    server celeborn.k02.com:8005;
    server oropher.k02.com:8006;
}

# Log format untuk tracking
log_format pharazon_limit '$remote_addr - $remote_user [$time_local] '
                          '"$request" $status $body_bytes_sent '
                          '"$http_referer" "$http_user_agent" '
                          'upstream: $upstream_addr '
                          'request_time: $request_time '
                          'limit_status: $limit_req_status';

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
    
    access_log /var/log/nginx/pharazon-access.log pharazon_limit;
    error_log /var/log/nginx/pharazon-error.log;

    location / {
        # RATE LIMITING: 10 req/s, burst 20, delay after 10
        limit_req zone=limit_pharazon burst=20 delay=10;
        
        proxy_pass http://Kesatria_Lorien;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Authorization $http_authorization;
        proxy_pass_header Authorization;
        
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }
}
EOF

echo "✓ Konfigurasi Rate Limiting dibuat"
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
echo "  ✅ RATE LIMITING AKTIF - PHARAZON"
echo "=============================================="
echo ""
echo "Rate Limit Configuration:"
echo "  - Zone: limit_pharazon"
echo "  - Rate: 10 requests/second"
echo "  - Burst: 20 requests"
echo "  - Delay: after 10 requests"
echo "  - Status code: 429 (Too Many Requests)"
echo ""
echo "Testing dari client:"
echo "  ab -n 200 -c 50 -A noldor:silvan http://pharazon.k02.com/"
echo ""
echo "Monitoring rate limit:"
echo "  tail -f /var/log/nginx/pharazon-error.log | grep limiting"
echo "  tail -f /var/log/nginx/pharazon-access.log | grep 429"
echo "=============================================="
UJI
CLIENT (Contoh: Gilgalad)
#!/bin/bash
# soal19-test-rate-limit.sh
# Testing Rate Limiting dari Client

set -e

echo "=============================================="
echo "  SOAL 19: TESTING RATE LIMITING"
echo "=============================================="
echo ""

# Install Apache Benchmark jika belum ada
if ! command -v ab &> /dev/null; then
    echo "Installing Apache Benchmark..."
    apt-get update -qq
    apt-get install -y apache2-utils
fi

echo "Pilih Load Balancer untuk ditest:"
echo "  1) Elros (Laravel - elros.k02.com)"
echo "  2) Pharazon (PHP - pharazon.k02.com)"
read -p "Pilihan (1/2): " CHOICE

if [ "$CHOICE" == "1" ]; then
    LB_NAME="Elros"
    LB_URL="http://elros.k02.com/api/airing"
    AB_AUTH=""
elif [ "$CHOICE" == "2" ]; then
    LB_NAME="Pharazon"
    LB_URL="http://pharazon.k02.com/"
    AB_AUTH="-A noldor:silvan"
else
    echo "Pilihan tidak valid!"
    exit 1
fi

echo ""
echo "=============================================="
echo "  TESTING: $LB_NAME"
echo "  URL: $LB_URL"
echo "=============================================="
echo ""

# Test 1: Normal load (should pass)
echo "[TEST 1] Normal Load - 50 requests, 5 concurrent"
echo "Expected: Semua sukses (rate limit tidak tercapai)"
echo "----------------------------------------"
ab -n 50 -c 5 $AB_AUTH $LB_URL 2>&1 | grep -E "Complete requests|Failed requests|Non-2xx"
echo ""
sleep 2

# Test 2: Medium burst (some might be delayed)
echo "[TEST 2] Medium Burst - 100 requests, 20 concurrent"
echo "Expected: Beberapa delayed (status 200), minimal yang ditolak"
echo "----------------------------------------"
ab -n 100 -c 20 $AB_AUTH $LB_URL 2>&1 | grep -E "Complete requests|Failed requests|Non-2xx"
echo ""
sleep 2

# Test 3: Heavy burst (should trigger rate limit)
echo "[TEST 3] Heavy Burst - 200 requests, 50 concurrent"
echo "Expected: Banyak request ditolak dengan 429"
echo "----------------------------------------"
ab -n 200 -c 50 $AB_AUTH $LB_URL 2>&1 | tee /tmp/ab-rate-limit-test.txt | \
    grep -E "Complete requests|Failed requests|Non-2xx"
echo ""
sleep 2

# Test 4: Extreme load
echo "[TEST 4] Extreme Load - 500 requests, 100 concurrent"
echo "Expected: Sangat banyak request ditolak"
echo "----------------------------------------"
ab -n 500 -c 100 $AB_AUTH $LB_URL 2>&1 | grep -E "Complete requests|Failed requests|Non-2xx"
echo ""

echo "=============================================="
echo "  📊 ANALISIS HASIL"
echo "=============================================="
echo ""
echo "Status Code Distribution (dari Test 3):"
grep "Non-2xx" /tmp/ab-rate-limit-test.txt || echo "Semua request berhasil (200 OK)"
echo ""

echo "=============================================="
echo "  ✅ TESTING SELESAI"
echo "=============================================="
echo ""
echo "Untuk melihat log rate limiting:"
echo ""
if [ "$CHOICE" == "1" ]; then
    echo "  Di Elros, jalankan:"
    echo "    tail -50 /var/log/nginx/elros-error.log | grep limiting"
    echo "    tail -50 /var/log/nginx/elros-access.log | awk '\$9==429 {print}'"
else
    echo "  Di Pharazon, jalankan:"
    echo "    tail -50 /var/log/nginx/pharazon-error.log | grep limiting"
    echo "    tail -50 /var/log/nginx/pharazon-access.log | awk '\$9==429 {print}'"
fi
echo "=============================================="
Monitoring (Elros/Pharazon)
#!/bin/bash
# soal19-monitor-rate-limit.sh
# Monitoring Rate Limit di Load Balancer
# Jalankan di Elros atau Pharazon

HOSTNAME=$(hostname | tr '[:upper:]' '[:lower:]')

if [[ "$HOSTNAME" == *"elros"* ]]; then
    ACCESS_LOG="/var/log/nginx/elros-access.log"
    ERROR_LOG="/var/log/nginx/elros-error.log"
    LB_NAME="Elros"
elif [[ "$HOSTNAME" == *"pharazon"* ]]; then
    ACCESS_LOG="/var/log/nginx/pharazon-access.log"
    ERROR_LOG="/var/log/nginx/pharazon-error.log"
    LB_NAME="Pharazon"
else
    echo "Script ini harus dijalankan di Elros atau Pharazon!"
    exit 1
fi

echo "=============================================="
echo "  RATE LIMIT MONITORING - $LB_NAME"
echo "=============================================="
echo ""

# 1. Total requests
echo "[1] Total Requests:"
echo "----------------------------------------"
TOTAL=$(wc -l < $ACCESS_LOG)
echo "  Total: $TOTAL requests"
echo ""

# 2. Status code distribution
echo "[2] HTTP Status Code Distribution:"
echo "----------------------------------------"
awk '{print $9}' $ACCESS_LOG | sort | uniq -c | sort -rn | \
    awk '{printf "  HTTP %s: %5d requests", $2, $1; if ($2==429) print " ← RATE LIMITED"; else print ""}'
echo "----------------------------------------"
echo ""

# 3. Rate limited requests
echo "[3] Rate Limited Requests (HTTP 429):"
echo "----------------------------------------"
RATE_LIMITED=$(grep " 429 " $ACCESS_LOG | wc -l)
if [ $RATE_LIMITED -gt 0 ]; then
    echo "  ⚠ Rate limited: $RATE_LIMITED requests"
    echo ""
    echo "  Last 10 rate limited requests:"
    grep " 429 " $ACCESS_LOG | tail -10 | \
        awk '{print "    " $4, $7, "from", $1}'
else
    echo "  ✓ No rate limited requests"
fi
echo "----------------------------------------"
echo ""

# 4. Error log - limiting messages
echo "[4] Rate Limiting Messages from Error Log:"
echo "----------------------------------------"
LIMIT_MSGS=$(grep "limiting requests" $ERROR_LOG 2>/dev/null | wc -l)
if [ $LIMIT_MSGS -gt 0 ]; then
    echo "  Found $LIMIT_MSGS limiting messages"
    echo ""
    echo "  Last 10 messages:"
    grep "limiting requests" $ERROR_LOG | tail -10 | \
        sed 's/^/    /'
else
    echo "  ✓ No limiting messages in error log"
fi
echo "----------------------------------------"
echo ""

# 5. Requests per second (approximate)
echo "[5] Request Rate Analysis:"
echo "----------------------------------------"
if [ $TOTAL -gt 0 ]; then
    # Get time range from log
    FIRST_TIME=$(head -1 $ACCESS_LOG | awk '{print $4}' | tr -d '[')
    LAST_TIME=$(tail -1 $ACCESS_LOG | awk '{print $4}' | tr -d '[')
    
    echo "  Log time range:"
    echo "    First: $FIRST_TIME"
    echo "    Last:  $LAST_TIME"
    echo ""
    
    # Count requests in last minute
    LAST_MIN=$(tail -100 $ACCESS_LOG | wc -l)
    echo "  Last ~100 requests rate: ~$LAST_MIN req/min"
fi
echo "----------------------------------------"
echo ""

# 6. Top IPs hitting rate limit
echo "[6] Top IPs Getting Rate Limited:"
echo "----------------------------------------"
grep " 429 " $ACCESS_LOG 2>/dev/null | \
    awk '{print $1}' | sort | uniq -c | sort -rn | head -5 | \
    awk '{printf "  %-15s: %3d times rate limited\n", $2, $1}' || \
    echo "  ✓ No IPs rate limited"
echo "----------------------------------------"
echo ""

echo "=============================================="
echo "  ✅ MONITORING COMPLETE"
echo "=============================================="
echo ""
echo "Summary for $LB_NAME:"
echo "  - Total requests: $TOTAL"
echo "  - Rate limited (429): $RATE_LIMITED"
echo "  - Limit messages: $LIMIT_MSGS"
echo ""
echo "Rate limit is working if:"
echo "  ✓ HTTP 429 responses appear during high load"
echo "  ✓ Error log shows 'limiting requests' messages"
echo "  ✓ Normal load (< 10 req/s) passes through"
echo "=============================================="
image