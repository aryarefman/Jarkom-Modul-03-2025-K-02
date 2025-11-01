Palantir
#!/bin/bash
# setup-palantir.sh — FINAL VERSION (NO SUDO!)
# Kelompok K-02 | Jarkom Modul 3

set -e

echo "=== [PALANTIR] Setup Database Server (NO SUDO) ==="

# === 1. Install MariaDB ===
echo "=== [1] Install MariaDB ==="
apt update -qq
apt install -y mariadb-server mariadb-client > /dev/null 2>&1

# === 2. Direktori runtime ===
echo "=== [2] Buat /run/mysqld ==="
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld
chmod 755 /run/mysqld

# === 3. Bind to all interfaces ===
echo "=== [3] bind-address = 0.0.0.0 ==="
cat > /etc/mysql/mariadb.conf.d/50-server.cnf << 'EOF'
[mysqld]
bind-address = 0.0.0.0
skip-networking = 0
EOF

# === 4. Inisialisasi datadir ===
if [ ! -d /var/lib/mysql/mysql ]; then
    echo "=== [4] Inisialisasi datadir ==="
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

# === 5. Stop proses lama ===
echo "=== [5] Stop proses lama ==="
pkill mariadbd 2>/dev/null || true
pkill mysqld_safe 2>/dev/null || true
sleep 3

# === 6. Start MariaDB ===
echo "=== [6] Start MariaDB ==="
/usr/bin/mysqld_safe --user=mysql --skip-grant-tables --skip-networking &
sleep 8

# === 7. Akses root VIA unix_socket (LANGSUNG mysql) ===
echo "=== [7] Setup DB & User ==="
mysql << 'EOF'
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';
CREATE DATABASE IF NOT EXISTS laravel_db;
CREATE USER IF NOT EXISTS 'laravel_user'@'%' IDENTIFIED BY 'laravel_password';
GRANT ALL PRIVILEGES ON laravel_db.* TO 'laravel_user'@'%';
FLUSH PRIVILEGES;
EOF

# === 8. Restart normal ===
echo "=== [8] Restart normal ==="
pkill mariadbd 2>/dev/null || true
pkill mysqld_safe 2>/dev/null || true
sleep 3
/usr/bin/mysqld_safe --user=mysql > /var/log/mysql.log 2>&1 &
sleep 8

# === 9. Test koneksi ===
echo "=== [9] Test koneksi ==="
if mysql -u laravel_user -p'laravel_password' -h 127.0.0.1 laravel_db -e "SELECT 'DB OK';" | grep -q "DB OK"; then
    echo "KONEKSI BERHASIL"
else
    echo "KONEKSI GAGAL"
    exit 1
fi

# === 10. Info ===
echo ""
echo "PALANTIR SIAP!"
echo "Host: $(hostname -I | awk '{print $1}')"
echo "DB: laravel_db"
echo "User: laravel_user"
echo "Pass: laravel_password"
echo ""
echo "Gunakan di .env worker:"
echo "DB_HOST=palantir.k02.com"
echo "DB_DATABASE=laravel_db"
echo "DB_USERNAME=laravel_user"
echo "DB_PASSWORD=laravel_password"
Elendil
#!/bin/bash
# soal8-elendil.sh — Setup Elendil (Port 8001)
# Jalankan di Elendil

set -e  # Exit on error

echo "=== [SOAL 8] Setup ELENDIL → port 8001 ==="

# 1. Install PHP MySQL Driver
echo "Installing PHP MySQL extension..."
apt-get update
apt-get install -y php8.2-mysql

# 2. Update .env
cd /var/www/resource-laravel-k1

# Backup .env
if [ ! -f .env.backup ]; then
    cp .env .env.backup
    echo "✓ Backup .env created"
fi

sed -i 's/DB_HOST=.*/DB_HOST=palantir.k02.com/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel_db/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=laravel_user/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=laravel_password/' .env
echo "✓ Updated .env → palantir.k02.com"

# 3. Update routes/api.php ke versi Controller-based
cat > routes/api.php << 'APIEOF'
<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AiringController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'airing'], function () {
   Route::get('/', [AiringController::class, 'index']);
   Route::get('/{id}', [AiringController::class, 'show']);
   Route::post('/', [AiringController::class, 'store']);
});
APIEOF

echo "✓ Updated routes/api.php"

# 4. Clear Laravel cache
php artisan config:clear
php artisan route:clear
php artisan cache:clear
echo "✓ Cache cleared"

# 5. Hapus config lama
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

# 6. Buat config Nginx (DENGAN explicit bind dan blocking yang lebih baik)
cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 0.0.0.0:8001;
    server_name elendil.k02.com;

    root /var/www/resource-laravel-k1/public;
    index index.php index.html;

    access_log /var/log/nginx/elendil-access.log;
    error_log /var/log/nginx/elendil-error.log;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }

    # OPTIONAL: Uncomment untuk blocking akses via IP (setelah testing berhasil)
    # Blocking yang lebih smart - hanya block IP mentah
    # if ($host ~ "^[0-9.]+(:8001)?$") {
    #     return 403;
    # }
}
EOF

echo "✓ Nginx config created (blocking disabled untuk testing)"

# 7. Aktifkan site
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# 8. Set permissions
chown -R www-data:www-data /var/www/resource-laravel-k1
chmod -R 775 /var/www/resource-laravel-k1/storage
chmod -R 775 /var/www/resource-laravel-k1/bootstrap/cache

# 9. Restart services
echo "Restarting services..."
service php8.2-fpm restart
sleep 1
nginx -t && service nginx restart
sleep 2

echo ""
echo "=== Testing Setup ==="

# Test database connection
echo "[1] Testing database connection..."
php -r "try { new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password'); echo '✓ Database connection OK\n'; } catch (Exception \$e) { echo '✗ Database FAILED: ' . \$e->getMessage() . '\n'; }"

# Test services
echo ""
echo "[2] Service status:"
ps aux | grep nginx | grep -v grep > /dev/null && echo "✓ Nginx running"
ps aux | grep php-fpm | grep -v grep > /dev/null && echo "✓ PHP-FPM running"

# Test port
echo ""
echo "[3] Port 8001 listening:"
ss -tulpn | grep :8001 || netstat -tulpn | grep :8001

# Test HTTP
echo ""
echo "[4] Testing HTTP..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8001)
echo "localhost:8001 → HTTP $HTTP_CODE"

MY_IP=$(hostname -I | awk '{print $1}')
HTTP_CODE_IP=$(curl -s -o /dev/null -w "%{http_code}" http://$MY_IP:8001)
echo "$MY_IP:8001 → HTTP $HTTP_CODE_IP"

# Test API
echo ""
echo "[5] Testing API endpoint /api/airing..."
curl -s http://localhost:8001/api/airing | head -20
echo ""

# Final summary
echo ""
echo "=========================================="
echo "✓✓✓ ELENDIL SETUP COMPLETE!"
echo "=========================================="
echo "Server IP: $MY_IP"
echo "Port: 8001"
echo ""
echo "Test dari client:"
echo "  curl http://elendil.k02.com:8001"
echo "  curl http://$MY_IP:8001"
echo "  lynx http://elendil.k02.com:8001"
echo ""
echo "NOTES:"
echo "- Blocking rule DISABLED untuk testing"
echo "- Jika semua test berhasil, uncomment blocking di:"
echo "  /etc/nginx/sites-available/laravel (line 28-30)"
echo "=========================================="
Isildur
#!/bin/bash
# soal8-isildur.sh — Setup Isildur (Port 8002)
# Jalankan di Isildur

echo "=== [SOAL 8] Setup ISILDUR → port 8002 ==="

# 1. Install PHP MySQL Driver
echo "Installing PHP MySQL extension..."
apt-get update
apt-get install -y php8.2-mysql

# 2. Update .env
cd /var/www/resource-laravel-k1
sed -i 's/DB_HOST=.*/DB_HOST=palantir.k02.com/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel_db/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=laravel_user/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=laravel_password/' .env
echo "✓ Updated .env → palantir.k02.com"

# 3. Update routes/api.php ke versi Controller-based (sudah ada, tapi pastikan)
cat > routes/api.php << 'APIEOF'
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AiringController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'airing'], function () {
   Route::get('/', [AiringController::class, 'index']);
   Route::get('/{id}', [AiringController::class, 'show']);
   Route::post('/', [AiringController::class, 'store']);
});
APIEOF
echo "✓ Updated routes/api.php"

# 4. Clear Laravel cache
php artisan config:clear
php artisan route:clear
php artisan cache:clear
echo "✓ Cache cleared"

# 5. Hapus config lama
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

# 6. Buat config Nginx
cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 8002;
    server_name isildur.k02.com;

    root /var/www/resource-laravel-k1/public;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
    }

    # BLOKIR AKSES VIA IP
    if ($host != "isildur.k02.com") {
        return 444;
    }
}
EOF

# 7. Aktifkan site
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# 8. Restart services
service php8.2-fpm restart
nginx -t && service nginx restart

echo ""
echo "=== Testing Setup ==="
php -r "new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');" && echo "✓ Database connection OK"
echo ""
echo "✓✓✓ ISILDUR SIAP → http://isildur.k02.com:8002"
echo "Testing API endpoint..."
sleep 2
curl -s http://localhost:8002/api/airing
echo ""
Anarion
#!/bin/bash
# soal8-anarion.sh — Setup Anarion (Port 8003)
# Jalankan di Anarion

echo "=== [SOAL 8] Setup ANARION → port 8003 ==="

# 1. Install PHP MySQL Driver
echo "Installing PHP MySQL extension..."
apt-get update
apt-get install -y php8.2-mysql

# 2. Update .env
cd /var/www/resource-laravel-k1
sed -i 's/DB_HOST=.*/DB_HOST=palantir.k02.com/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel_db/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=laravel_user/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=laravel_password/' .env
echo "✓ Updated .env → palantir.k02.com"

# 3. Update routes/api.php ke versi Controller-based
cat > routes/api.php << 'APIEOF'
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AiringController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'airing'], function () {
   Route::get('/', [AiringController::class, 'index']);
   Route::get('/{id}', [AiringController::class, 'show']);
   Route::post('/', [AiringController::class, 'store']);
});
APIEOF
echo "✓ Updated routes/api.php"

# 4. Clear Laravel cache
php artisan config:clear
php artisan route:clear
php artisan cache:clear
echo "✓ Cache cleared"

# 5. Hapus config lama
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

# 6. Buat config Nginx
cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 8003;
    server_name anarion.k02.com;

    root /var/www/resource-laravel-k1/public;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
    }

    # BLOKIR AKSES VIA IP
    if ($host != "anarion.k02.com") {
        return 444;
    }
}
EOF

# 7. Aktifkan site
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# 8. Restart services
service php8.2-fpm restart
nginx -t && service nginx restart

echo ""
echo "=== Testing Setup ==="
php -r "new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');" && echo "✓ Database connection OK"
echo ""
echo "✓✓✓ ANARION SIAP → http://anarion.k02.com:8003"
echo "Testing API endpoint..."
sleep 2
curl -s http://localhost:8003/api/airing
echo ""
Laravel Workers (Elendil, Isildur, Anarion)
apt-get update
apt-get install -y mariadb-client
mysql -u laravel_user -p'laravel_password' -h palantir.k02.com -e "SHOW DATABASES;"