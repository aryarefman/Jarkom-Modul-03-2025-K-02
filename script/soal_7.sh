Laravel Workers (Elendil, Isildur, Anarion)
#!/bin/bash
# Script instalasi Laravel dengan Nginx dan PHP 8.2 - NETWORK TIMEOUT FIXED
# Usage: bash soal7-fixed-network.sh

set -e  # Exit on error

echo "=== Memulai instalasi Laravel ==="

# Update sources.list
echo "=== Mengupdate sources.list ==="
cat > /etc/apt/sources.list << 'EOF'
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free
EOF

# Update package list
echo "=== Updating package list ==="
apt-get update

# Install dependencies
echo "=== Installing dependencies ==="
apt-get install -y software-properties-common
apt-get install -y lsb-release ca-certificates apt-transport-https gnupg2 curl git unzip

# Add PHP repository
echo "=== Adding PHP repository ==="
curl -sSL https://packages.sury.org/php/README.txt | bash -x

# Install PHP 8.2 and extensions
echo "=== Installing PHP 8.2 ==="
apt install -y php8.2 php8.2-fpm php8.2-cli php8.2-common php8.2-curl php8.2-mbstring php8.2-xml php8.2-zip php8.2-bcmath php8.2-gd unzip git

# Install Nginx
echo "=== Installing Nginx ==="
apt-get install -y nginx
service nginx start
ps aux | grep nginx

# Install Composer
echo "=== Installing Composer ==="
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer --version

# Clone Laravel project
echo "=== Cloning Laravel project ==="
cd /var/www

# Hapus directory lama jika ada
if [ -d "resource-laravel-k1" ]; then
    echo "⚠ Directory resource-laravel-k1 sudah ada, menghapus..."
    rm -rf resource-laravel-k1
fi

git clone https://github.com/elshiraphine/laravel-simple-rest-api.git resource-laravel-k1
cd resource-laravel-k1

# Install dependencies - TANPA UPDATE untuk hindari timeout
echo "=== Installing Laravel dependencies ==="
echo "⚠ Skipping composer update untuk menghindari network timeout"

# Cek apakah vendor sudah ada dari repo
if [ -d "vendor" ] && [ -n "$(ls -A vendor)" ]; then
    echo "✓ Vendor directory sudah ada dari repository"
    composer install --no-interaction --prefer-dist --no-dev || {
        echo "⚠ Composer install gagal, menggunakan vendor yang sudah ada"
    }
else
    echo "Installing dependencies dari packagist..."
    composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader || {
        echo "✗ Composer install gagal!"
        echo "Mencoba mode offline..."
        COMPOSER_DISABLE_NETWORK=1 composer install --no-interaction || {
            echo "✗ Mode offline juga gagal. Melanjutkan tanpa composer..."
        }
    }
fi

# Setup environment
echo "=== Setting up environment ==="
cp .env.example .env
php artisan key:generate

# Verify installation
echo "=== Verifying installation ==="
ls -la /var/www/resource-laravel-k1/ | head -15
echo ""
echo "=== .env content ==="
cat /var/www/resource-laravel-k1/.env
echo ""
echo "=== Vendor directory ==="
if [ -d "vendor" ]; then
    ls /var/www/resource-laravel-k1/vendor/ | head -10
    echo "✓ Vendor directory OK"
else
    echo "⚠ Vendor directory tidak ada"
fi
echo ""
php artisan --version

# Configure Nginx
echo "=== Configuring Nginx ==="

# Remove old configs
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 80;
    server_name _;  # Accept any hostname/IP

    root /var/www/resource-laravel-k1/public;
    index index.php index.html;

    # Logging
    access_log /var/log/nginx/laravel-access.log;
    error_log /var/log/nginx/laravel-error.log;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico {
        access_log off;
        log_not_found off;
    }

    location = /robots.txt {
        access_log off;
        log_not_found off;
    }

    error_page 404 /index.php;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
EOF

# Enable site
echo "=== Enabling Laravel site ==="
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# Set permissions
echo "=== Setting permissions ==="
cd /var/www/resource-laravel-k1
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
chown -R www-data:www-data /var/www/resource-laravel-k1

# Start services
echo "=== Starting PHP-FPM ==="
service php8.2-fpm restart
sleep 2

echo "=== PHP-FPM Socket Check ==="
ls -la /run/php/

# Test and restart Nginx
echo "=== Testing and restarting Nginx ==="
nginx -t
if [ $? -eq 0 ]; then
    service nginx restart
    echo "✓ Nginx restarted successfully"
else
    echo "✗ Nginx config error!"
    exit 1
fi

echo ""
echo "=========================================="
echo "  ✅ INSTALASI SELESAI!"
echo "=========================================="
echo ""

# Testing
echo "=== TESTING ==="
MY_IP=$(hostname -I | awk '{print $1}')

echo "[1] Services Status:"
ps aux | grep php-fpm | grep -v grep | head -2
ps aux | grep nginx | grep -v grep | head -2

echo ""
echo "[2] Port 80 Listening:"
netstat -tulpn | grep :80 2>/dev/null || ss -tulpn | grep :80 2>/dev/null || echo "⚠ netstat/ss not available"

echo ""
echo "[3] Test HTTP via localhost:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost 2>/dev/null)
if [ "$HTTP_CODE" == "200" ]; then
    echo "✓ HTTP 200 OK"
    curl -s http://localhost 2>/dev/null | head -30
else
    echo "✗ HTTP $HTTP_CODE - ERROR!"
    echo "Checking error log..."
    tail -20 /var/log/nginx/laravel-error.log 2>/dev/null || echo "No error log found"
fi

echo ""
echo "[4] Test API endpoint:"
API_RESPONSE=$(curl -s http://localhost/api/airing 2>&1)
if echo "$API_RESPONSE" | grep -q "airing\|id\|title" 2>/dev/null; then
    echo "✓ API endpoint working"
    echo "$API_RESPONSE" | head -30
else
    echo "⚠ API response:"
    echo "$API_RESPONSE" | head -30
fi

echo ""
echo "=========================================="
echo "  AKSES INFO"
echo "=========================================="
echo "IP Address: $MY_IP"
echo ""
echo "Akses dari node ini:"
echo "  curl http://localhost"
echo "  curl http://localhost/api/airing"
echo ""
echo "Akses dari client:"
echo "  lynx http://$MY_IP"
echo "  curl http://$MY_IP/api/airing"
echo ""
echo "=========================================="
echo ""
echo "Jika ada error, cek log:"
echo "  tail -f /var/log/nginx/laravel-error.log"
echo "  tail -f /var/log/php8.2-fpm.log"
echo "=========================================="