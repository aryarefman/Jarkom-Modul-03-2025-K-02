Pharazon
#!/bin/bash
# =============================================================
# SOAL 16 - PHARAZON REVERSE PROXY
# Mengawasi taman-taman Peri (Galadriel, Celeborn, Oropher)
# dengan load balancing Round Robin
# =============================================================

set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root!"
  exit 1
fi

echo "=============================================="
echo "     👑 SETUP PHARAZON - REVERSE PROXY"
echo "=============================================="

# 1) Install Nginx jika belum ada
echo "[1/5] Memastikan Nginx terinstal..."
apt-get update -y >/dev/null 2>&1
apt-get install -y nginx curl dnsutils >/dev/null 2>&1

# 2) Backup konfigurasi lama
echo "[2/5] Backup konfigurasi lama..."
if [ -f /etc/nginx/sites-available/pharazon-lb ]; then
    cp /etc/nginx/sites-available/pharazon-lb /etc/nginx/sites-available/pharazon-lb.backup
    echo "✓ Backup dibuat"
fi

# 3) Hapus konfigurasi default
echo "[3/5] Menghapus konfigurasi default..."
rm -f /etc/nginx/sites-enabled/default

# 4) Buat konfigurasi reverse proxy
echo "[4/5] Membuat konfigurasi Reverse Proxy..."
cat > /etc/nginx/sites-available/pharazon-lb << 'EOF'
# Upstream definition untuk Kesatria_Lorien
upstream Kesatria_Lorien {
    server galadriel.k02.com:8004;
    server celeborn.k02.com:8005;
    server oropher.k02.com:8006;
}

# Log format untuk tracking
log_format pharazon_log '$remote_addr - $remote_user [$time_local] '
                        '"$request" $status $body_bytes_sent '
                        '"$http_referer" "$http_user_agent" '
                        'upstream: $upstream_addr auth: $http_authorization';

# Blokir akses via IP langsung
server {
    listen 80 default_server;
    server_name ~^[0-9.]+$;
    return 444;
}

# Server block untuk pharazon.k02.com
server {
    listen 80;
    server_name pharazon.k02.com;

    access_log /var/log/nginx/pharazon-access.log pharazon_log;
    error_log /var/log/nginx/pharazon-error.log;

    location / {
        # Teruskan request ke upstream
        proxy_pass http://Kesatria_Lorien;

        # Header standar untuk reverse proxy
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # PENTING: Teruskan Basic Authentication
        proxy_set_header Authorization $http_authorization;
        proxy_pass_header Authorization;

        # Timeout settings
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;

        # Buffer settings untuk performa
        proxy_buffering on;
        proxy_buffer_size 4k;
        proxy_buffers 8 4k;
    }
}
EOF

echo "✓ Konfigurasi dibuat di /etc/nginx/sites-available/pharazon-lb"

# 5) Aktifkan konfigurasi
echo "[5/5] Mengaktifkan konfigurasi..."
ln -sf /etc/nginx/sites-available/pharazon-lb /etc/nginx/sites-enabled/pharazon-lb

# Test dan restart nginx
echo ""
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
        echo "✓ Nginx berhasil di-start"
    else
        echo "✗ Nginx gagal di-start"
        exit 1
    fi
else
    echo "✗ Nginx config error"
    exit 1
fi

echo ""
echo "=============================================="
echo "  ✅ PHARAZON REVERSE PROXY SIAP"
echo "=============================================="
echo ""
echo "Konfigurasi Pharazon:"
echo "  Domain: pharazon.k02.com"
echo "  Upstream: Kesatria_Lorien"
echo "    - galadriel.k02.com:8004"
echo "    - celeborn.k02.com:8005"
echo "    - oropher.k02.com:8006"
echo "  Algorithm: Round Robin"
echo ""
echo "Testing dari client:"
echo "  curl -u noldor:silvan http://pharazon.k02.com/"
echo ""
echo "Melihat distribusi request:"
echo "  tail -f /var/log/nginx/pharazon-access.log"
echo ""
echo "=============================================="
Galadriel
#!/bin/bash
# restart-nginx-galadriel.sh
# Jalankan di Galadriel

echo "=============================================="
echo "  RESTART & FIX NGINX - GALADRIEL"
echo "=============================================="
echo ""

# 1. Cek proses nginx
echo "[1] Cek proses nginx..."
if ps aux | grep -v grep | grep nginx > /dev/null; then
    echo "✓ Nginx process ditemukan"
    ps aux | grep nginx | grep -v grep
else
    echo "✗ Nginx tidak berjalan"
fi
echo ""

# 2. Kill semua proses nginx jika ada
echo "[2] Stop semua proses nginx..."
pkill nginx 2>/dev/null || true
sleep 2
echo "✓ Proses nginx dihentikan"
echo ""

# 3. Cek konfigurasi nginx
echo "[3] Cek konfigurasi nginx..."
nginx -t
if [ $? -ne 0 ]; then
    echo "✗ Ada error di konfigurasi!"
    echo ""
    echo "Menampilkan konfigurasi aktif:"
    cat /etc/nginx/sites-enabled/galadriel.k02.com
    exit 1
fi
echo "✓ Konfigurasi OK"
echo ""

# 4. Pastikan PHP-FPM berjalan
echo "[4] Cek dan start PHP-FPM..."
if ! pgrep -x "php-fpm8.4" > /dev/null; then
    echo "Starting PHP-FPM..."
    service php8.4-fpm start || php-fpm8.4 || true
    sleep 2
fi

if pgrep -x "php-fpm8.4" > /dev/null; then
    echo "✓ PHP-FPM running"
else
    echo "⚠ PHP-FPM mungkin belum running"
fi
echo ""

# 5. Start nginx
echo "[5] Start nginx..."
service nginx start 2>/dev/null || nginx
sleep 2

if ps aux | grep -v grep | grep nginx > /dev/null; then
    echo "✓ Nginx berhasil di-start"
    ps aux | grep nginx | grep -v grep | head -3
else
    echo "✗ Nginx gagal di-start"
    echo ""
    echo "Cek error log:"
    tail -20 /var/log/nginx/error.log 2>/dev/null || echo "No error log"
    exit 1
fi
echo ""

# 6. Cek port 8004
echo "[6] Cek port 8004..."
if ss -tulpn 2>/dev/null | grep -q ":8004" || netstat -tulpn 2>/dev/null | grep -q ":8004"; then
    echo "✓ Port 8004 listening"
    ss -tulpn 2>/dev/null | grep ":8004" || netstat -tulpn 2>/dev/null | grep ":8004"
else
    echo "✗ Port 8004 tidak listening!"
    echo ""
    echo "Semua port yang listening:"
    ss -tulpn 2>/dev/null | grep nginx || netstat -tulpn 2>/dev/null | grep nginx
fi
echo ""

# 7. Test HTTP
echo "[7] Test HTTP localhost:8004..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u noldor:silvan http://localhost:8004/ 2>/dev/null)
echo "HTTP Status: $HTTP_CODE"

if [ "$HTTP_CODE" == "200" ]; then
    echo "✓ HTTP Response OK"
    echo ""
    curl -s -u noldor:silvan http://localhost:8004/ | grep -E "Server:|Alamat IP" | sed 's/<[^>]*>//g'
else
    echo "✗ HTTP Response failed"
    echo ""
    echo "Cek akses log:"
    tail -10 /var/log/nginx/galadriel.access.log 2>/dev/null || echo "No access log"
    echo ""
    echo "Cek error log:"
    tail -10 /var/log/nginx/galadriel.error.log 2>/dev/null || echo "No error log"
fi
echo ""

echo "=============================================="
echo "  Status Galadriel:"
if [ "$HTTP_CODE" == "200" ]; then
    echo "  ✅ SIAP DIGUNAKAN"
else
    echo "  ⚠ PERLU PERBAIKAN"
fi
echo "=============================================="
Celeborn
#!/bin/bash
# fix-worker-hostname.sh
# Jalankan di setiap worker PHP (Galadriel, Celeborn, Oropher)

set -e  # Exit on error, tapi tidak strict untuk troubleshooting

HOSTNAME=$(hostname)
HOSTNAME_LOWER=$(echo "$HOSTNAME" | tr '[:upper:]' '[:lower:]')
DOMAIN="${HOSTNAME_LOWER}.k02.com"
WEBROOT="/var/www/${DOMAIN}"

echo "=============================================="
echo "  Updating index.php untuk $HOSTNAME"
echo "=============================================="
echo ""
echo "Hostname: $HOSTNAME"
echo "Domain: $DOMAIN"
echo "Webroot: $WEBROOT"
echo ""

# Cek apakah webroot ada
if [ ! -d "$WEBROOT" ]; then
    echo "⚠ Webroot $WEBROOT tidak ditemukan!"
    echo ""
    echo "Mencari direktori yang ada di /var/www/..."
    ls -la /var/www/
    echo ""

    # Cari direktori yang cocok (case-insensitive)
    FOUND_DIR=$(find /var/www -maxdepth 1 -type d -iname "*${HOSTNAME_LOWER}*" 2>/dev/null | head -1)

    if [ -n "$FOUND_DIR" ]; then
        echo "✓ Ditemukan: $FOUND_DIR"
        WEBROOT="$FOUND_DIR"
    else
        echo "Membuat direktori baru: $WEBROOT"
        mkdir -p "$WEBROOT"
    fi
fi

echo ""
echo "Menggunakan webroot: $WEBROOT"
echo ""

# Buat index.php
cat > "${WEBROOT}/index.php" << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>Taman Peri - IP Pengunjung</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #e0f7fa, #fce4ec);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}
.card {
    background: rgba(255,255,255,0.9);
    padding: 40px 60px;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    text-align: center;
}
h1 {
    color: #6a1b9a;
    margin-bottom: 10px;
}
p {
    font-size: 18px;
    color: #333;
}
.hostname {
    color: #1976d2;
    font-weight: bold;
    font-size: 20px;
}
footer {
    margin-top: 10px;
    font-size: 13px;
    color: #777;
}
</style>
</head>
<body>
<div class="card">
    <h1>✨ Selamat Datang di Taman Peri ✨</h1>
    <p>Server: <span class="hostname"><?php echo gethostname(); ?></span></p>
    <p>Alamat IP Anda adalah:<br><b><?php echo $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR']; ?></b></p>
    <footer>🌿 Cahaya peri sedang memantau langkahmu 🌿</footer>
</div>
</body>
</html>
EOF

# Set permissions
chown -R www-data:www-data "$WEBROOT"
chmod 644 "${WEBROOT}/index.php"
chmod 755 "$WEBROOT"

echo "✓ index.php berhasil dibuat/diupdate"
echo ""

# Tampilkan isi file untuk verifikasi
echo "Preview index.php:"
echo "----------------------------------------"
head -20 "${WEBROOT}/index.php"
echo "..."
echo "----------------------------------------"
echo ""

# Detect port berdasarkan hostname
case "$HOSTNAME_LOWER" in
    galadriel)
        PORT=8004
        ;;
    celeborn)
        PORT=8005
        ;;
    oropher)
        PORT=8006
        ;;
    *)
        PORT=""
        ;;
esac

# Test lokal jika port ditemukan
if [ -n "$PORT" ]; then
    echo "Testing akses lokal di port $PORT..."
    echo ""

    # Cek apakah nginx listening di port tersebut
    if ss -tulpn | grep -q ":$PORT "; then
        echo "✓ Nginx listening di port $PORT"
        echo ""
        echo "Test HTTP Response:"
        echo "----------------------------------------"
        RESPONSE=$(curl -s -u noldor:silvan "http://localhost:$PORT/" 2>&1)

        if echo "$RESPONSE" | grep -q "Selamat Datang"; then
            echo "✓ Response OK"
            echo "$RESPONSE" | grep -E "Server:|Alamat IP" | sed 's/<[^>]*>//g'
        else
            echo "⚠ Response tidak sesuai:"
            echo "$RESPONSE" | head -10
        fi
        echo "----------------------------------------"
    else
        echo "⚠ Nginx tidak listening di port $PORT"
        echo ""
        echo "Port yang sedang listening:"
        ss -tulpn | grep nginx || echo "Nginx tidak berjalan"
    fi
fi

echo ""
echo "=============================================="
echo "  ✅ SELESAI"
echo "=============================================="
echo ""
echo "File location: ${WEBROOT}/index.php"
echo "Akses dari client:"
echo "  curl -u noldor:silvan http://${DOMAIN}:${PORT}/"
echo "  curl -u noldor:silvan http://pharazon.k02.com/"
echo "=============================================="
Oropher
#!/bin/bash
# fix-worker-hostname.sh
# Jalankan di setiap worker PHP (Galadriel, Celeborn, Oropher)

set -e  # Exit on error, tapi tidak strict untuk troubleshooting

HOSTNAME=$(hostname)
HOSTNAME_LOWER=$(echo "$HOSTNAME" | tr '[:upper:]' '[:lower:]')
DOMAIN="${HOSTNAME_LOWER}.k02.com"
WEBROOT="/var/www/${DOMAIN}"

echo "=============================================="
echo "  Updating index.php untuk $HOSTNAME"
echo "=============================================="
echo ""
echo "Hostname: $HOSTNAME"
echo "Domain: $DOMAIN"
echo "Webroot: $WEBROOT"
echo ""

# Cek apakah webroot ada
if [ ! -d "$WEBROOT" ]; then
    echo "⚠ Webroot $WEBROOT tidak ditemukan!"
    echo ""
    echo "Mencari direktori yang ada di /var/www/..."
    ls -la /var/www/
    echo ""

    # Cari direktori yang cocok (case-insensitive)
    FOUND_DIR=$(find /var/www -maxdepth 1 -type d -iname "*${HOSTNAME_LOWER}*" 2>/dev/null | head -1)

    if [ -n "$FOUND_DIR" ]; then
        echo "✓ Ditemukan: $FOUND_DIR"
        WEBROOT="$FOUND_DIR"
    else
        echo "Membuat direktori baru: $WEBROOT"
        mkdir -p "$WEBROOT"
    fi
fi

echo ""
echo "Menggunakan webroot: $WEBROOT"
echo ""

# Buat index.php
cat > "${WEBROOT}/index.php" << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>Taman Peri - IP Pengunjung</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #e0f7fa, #fce4ec);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}
.card {
    background: rgba(255,255,255,0.9);
    padding: 40px 60px;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    text-align: center;
}
h1 {
    color: #6a1b9a;
    margin-bottom: 10px;
}
p {
    font-size: 18px;
    color: #333;
}
.hostname {
    color: #1976d2;
    font-weight: bold;
    font-size: 20px;
}
footer {
    margin-top: 10px;
    font-size: 13px;
    color: #777;
}
</style>
</head>
<body>
<div class="card">
    <h1>✨ Selamat Datang di Taman Peri ✨</h1>
    <p>Server: <span class="hostname"><?php echo gethostname(); ?></span></p>
    <p>Alamat IP Anda adalah:<br><b><?php echo $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR']; ?></b></p>
    <footer>🌿 Cahaya peri sedang memantau langkahmu 🌿</footer>
</div>
</body>
</html>
EOF

# Set permissions
chown -R www-data:www-data "$WEBROOT"
chmod 644 "${WEBROOT}/index.php"
chmod 755 "$WEBROOT"

echo "✓ index.php berhasil dibuat/diupdate"
echo ""

# Tampilkan isi file untuk verifikasi
echo "Preview index.php:"
echo "----------------------------------------"
head -20 "${WEBROOT}/index.php"
echo "..."
echo "----------------------------------------"
echo ""

# Detect port berdasarkan hostname
case "$HOSTNAME_LOWER" in
    galadriel)
        PORT=8004
        ;;
    celeborn)
        PORT=8005
        ;;
    oropher)
        PORT=8006
        ;;
    *)
        PORT=""
        ;;
esac

# Test lokal jika port ditemukan
if [ -n "$PORT" ]; then
    echo "Testing akses lokal di port $PORT..."
    echo ""

    # Cek apakah nginx listening di port tersebut
    if ss -tulpn | grep -q ":$PORT "; then
        echo "✓ Nginx listening di port $PORT"
        echo ""
        echo "Test HTTP Response:"
        echo "----------------------------------------"
        RESPONSE=$(curl -s -u noldor:silvan "http://localhost:$PORT/" 2>&1)

        if echo "$RESPONSE" | grep -q "Selamat Datang"; then
            echo "✓ Response OK"
            echo "$RESPONSE" | grep -E "Server:|Alamat IP" | sed 's/<[^>]*>//g'
        else
            echo "⚠ Response tidak sesuai:"
            echo "$RESPONSE" | head -10
        fi
        echo "----------------------------------------"
    else
        echo "⚠ Nginx tidak listening di port $PORT"
        echo ""
        echo "Port yang sedang listening:"
        ss -tulpn | grep nginx || echo "Nginx tidak berjalan"
    fi
fi

echo ""
echo "=============================================="
echo "  ✅ SELESAI"
echo "=============================================="
echo ""
echo "File location: ${WEBROOT}/index.php"
echo "Akses dari client:"
echo "  curl -u noldor:silvan http://${DOMAIN}:${PORT}/"
echo "  curl -u noldor:silvan http://pharazon.k02.com/"
echo "=============================================="