Di AMANDIL - Benchmark TANPA Weight
#!/bin/bash
# soal11-client.sh - Benchmark di Client
# Jalankan di AMANDIL

echo "=========================================="
echo "  SOAL 11: BENCHMARK LOAD BALANCER"
echo "=========================================="
echo ""

# Install Apache Benchmark jika belum ada
if ! command -v ab &> /dev/null; then
    echo "Installing Apache Benchmark..."
    apt-get update -qq
    apt-get install -y apache2-utils
fi

read -p "Benchmark [1] TANPA weight atau [2] DENGAN weight? (1/2): " MODE

if [ "$MODE" == "1" ]; then
    PREFIX="noweight"
    TITLE="TANPA WEIGHT"
else
    PREFIX="weight"
    TITLE="DENGAN WEIGHT"
fi

echo ""
echo "=========================================="
echo "  BENCHMARK $TITLE"
echo "=========================================="
echo ""

# Test 1
echo "=== TEST 1: Serangan Awal (n=100, c=10) ==="
ab -n 100 -c 10 http://elros.k02.com/api/airing | tee /tmp/ab-test1-$PREFIX.txt

echo ""
echo "=========================================="
echo ""

# Tunggu sebentar
sleep 2

# Test 2
echo "=== TEST 2: Serangan Penuh (n=2000, c=100) ==="
ab -n 2000 -c 100 http://elros.k02.com/api/airing | tee /tmp/ab-test2-$PREFIX.txt

echo ""
echo "=========================================="
echo "  RINGKASAN HASIL"
echo "=========================================="
echo ""
echo "TEST 1 (n=100, c=10):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test1-$PREFIX.txt | head -3
echo ""
echo "TEST 2 (n=2000, c=100):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test2-$PREFIX.txt | head -3
echo ""
echo "=========================================="
echo "Hasil lengkap tersimpan di:"
echo "  /tmp/ab-test1-$PREFIX.txt"
echo "  /tmp/ab-test2-$PREFIX.txt"
echo "=========================================="

# Jika sudah ada kedua hasil, tampilkan perbandingan
if [ -f /tmp/ab-test1-noweight.txt ] && [ -f /tmp/ab-test1-weight.txt ]; then
    echo ""
    echo "=========================================="
    echo "  PERBANDINGAN LENGKAP"
    echo "=========================================="
    echo ""
    echo "TEST 1 (n=100, c=10):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-weight.txt | head -2
    echo ""
    echo "----------------------------------------"
    echo ""
    echo "TEST 2 (n=2000, c=100):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-weight.txt | head -2
    echo ""
    echo "=========================================="
fi

echo ""
image
image
image

Di ELROS - Update Config dengan Weight
#!/bin/bash
# soal11-elros.sh - Update config dengan weight
# Jalankan di ELROS

echo "=========================================="
echo "  SOAL 11: UPDATE CONFIG ELROS"
echo "=========================================="
echo ""

# Backup config lama
if [ -f /etc/nginx/sites-available/load-balancer ]; then
    cp /etc/nginx/sites-available/load-balancer /etc/nginx/sites-available/load-balancer.backup
    echo "✓ Backup config dibuat"
fi

# Buat config dengan weight
cat > /etc/nginx/sites-available/load-balancer << 'EOF'
upstream kesatria_numenor {
    server elendil.k02.com:8001 weight=3;
    server isildur.k02.com:8002 weight=2;
    server anarion.k02.com:8003 weight=1;
}

server {
    listen 80;
    server_name elros.k02.com;

    location / {
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    if ($host != "elros.k02.com") {
        return 444;
    }
}
EOF

echo "✓ Config dengan weight dibuat"
echo ""

# Test dan restart
echo "Testing nginx config..."
nginx -t

if [ $? -eq 0 ]; then
    echo ""
    echo "Restarting nginx..."
    service nginx restart
    sleep 2
    
    if ps aux | grep nginx | grep -v grep > /dev/null; then
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
echo "=========================================="
echo "✅ CONFIG UPDATE SELESAI"
echo "=========================================="
echo "Weight Distribution:"
echo "  - Elendil: weight=3 (50% traffic)"
echo "  - Isildur: weight=2 (33% traffic)"
echo "  - Anarion: weight=1 (17% traffic)"
echo ""
echo "Sekarang jalankan benchmark di Client lagi:"
echo "  bash soal11-client.sh"
echo "  Pilih: 2 (DENGAN weight)"
echo "=========================================="
image
Di AMANDIL - Benchmark DENGAN Weight
#!/bin/bash
# soal11-client.sh - Benchmark di Client
# Jalankan di AMANDIL

echo "=========================================="
echo "  SOAL 11: BENCHMARK LOAD BALANCER"
echo "=========================================="
echo ""

# Install Apache Benchmark jika belum ada
if ! command -v ab &> /dev/null; then
    echo "Installing Apache Benchmark..."
    apt-get update -qq
    apt-get install -y apache2-utils
fi

read -p "Benchmark [1] TANPA weight atau [2] DENGAN weight? (1/2): " MODE

if [ "$MODE" == "1" ]; then
    PREFIX="noweight"
    TITLE="TANPA WEIGHT"
else
    PREFIX="weight"
    TITLE="DENGAN WEIGHT"
fi

echo ""
echo "=========================================="
echo "  BENCHMARK $TITLE"
echo "=========================================="
echo ""

# Test 1
echo "=== TEST 1: Serangan Awal (n=100, c=10) ==="
ab -n 100 -c 10 http://elros.k02.com/api/airing | tee /tmp/ab-test1-$PREFIX.txt

echo ""
echo "=========================================="
echo ""

# Tunggu sebentar
sleep 2

# Test 2
echo "=== TEST 2: Serangan Penuh (n=2000, c=100) ==="
ab -n 2000 -c 100 http://elros.k02.com/api/airing | tee /tmp/ab-test2-$PREFIX.txt

echo ""
echo "=========================================="
echo "  RINGKASAN HASIL"
echo "=========================================="
echo ""
echo "TEST 1 (n=100, c=10):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test1-$PREFIX.txt | head -3
echo ""
echo "TEST 2 (n=2000, c=100):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test2-$PREFIX.txt | head -3
echo ""
echo "=========================================="
echo "Hasil lengkap tersimpan di:"
echo "  /tmp/ab-test1-$PREFIX.txt"
echo "  /tmp/ab-test2-$PREFIX.txt"
echo "=========================================="

# Jika sudah ada kedua hasil, tampilkan perbandingan
if [ -f /tmp/ab-test1-noweight.txt ] && [ -f /tmp/ab-test1-weight.txt ]; then
    echo ""
    echo "=========================================="
    echo "  PERBANDINGAN LENGKAP"
    echo "=========================================="
    echo ""
    echo "TEST 1 (n=100, c=10):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-weight.txt | head -2
    echo ""
    echo "----------------------------------------"
    echo ""
    echo "TEST 2 (n=2000, c=100):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-weight.txt | head -2
    echo ""
    echo "=========================================="
fi

echo ""
image
image
image

Perbandingan Lengkap
image