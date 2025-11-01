#!/bin/bash
# =======================================================
# SOAL 14 - Basic HTTP Authentication untuk Taman Peri
# Domain: galadriel.k02.com, celeborn.k02.com, oropher.k02.com
# User: noldor | Pass: silvan
# =======================================================

if [ "$EUID" -ne 0 ]; then
  echo "Harap jalankan script ini sebagai root!"
  exit 1
fi

echo "=============================================="
echo "     🔒 KONFIGURASI KEAMANAN TAMAN PERI"
echo "=============================================="

# 1️⃣ Pastikan nginx, php-fpm, dan apache2-utils terpasang
echo "[+] Memastikan nginx, php-fpm, dan apache2-utils terpasang..."
apt update -y >/dev/null 2>&1
apt install -y nginx php8.4-fpm apache2-utils >/dev/null 2>&1

# 2️⃣ Pastikan PHP-FPM berjalan
if ! pgrep -x "php-fpm8.4" >/dev/null; then
  echo "[+] Menjalankan PHP-FPM..."
  mkdir -p /run/php
  php-fpm8.4 -D
fi

# 3️⃣ Nonaktifkan konfigurasi default nginx
echo "[+] Menghapus konfigurasi default nginx..."
rm -f /etc/nginx/sites-enabled/default

# 4️⃣ Buat file htpasswd
echo "[+] Membuat file .htpasswd untuk autentikasi..."
htpasswd -cb /etc/nginx/.htpasswd noldor silvan >/dev/null 2>&1
chmod 644 /etc/nginx/.htpasswd
chown root:www-data /etc/nginx/.htpasswd

# 5️⃣ Cari socket PHP-FPM
SOCK=$(find /run/php/ -type s -name "php*-fpm.sock" | head -n 1)
if [ -z "$SOCK" ]; then
  echo "❌ Tidak ditemukan socket PHP-FPM! Pastikan php-fpm berjalan."
  exit 1
fi
echo "[+] Menggunakan socket PHP-FPM: $SOCK"

# 6️⃣ Fungsi membuat konfigurasi tiap domain
setup_worker() {
  local name=$1
  local port=$2
  local domain="${name}.k02.com"
  local webroot="/var/www/${domain}"

  echo ""
  echo "----------------------------------------------"
  echo "[+] Membuat konfigurasi untuk ${domain} (port ${port})"
  echo "----------------------------------------------"

  # Direktori & file PHP
  mkdir -p ${webroot}
  echo "<?php echo 'Halo dari ${name}! Hostname: ' . gethostname(); ?>" > ${webroot}/index.php
  chown -R www-data:www-data ${webroot}

  # Konfigurasi nginx
  cat > /etc/nginx/sites-available/${domain} << EOF
server {
    listen ${port};
    server_name ${domain};

    root ${webroot};
    index index.php index.html;

    location / {
        auth_basic "Restricted Area - ${name}";
        auth_basic_user_file /etc/nginx/.htpasswd;
        try_files \$uri \$uri/ /index.php;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        auth_basic "Restricted Area - ${name}";
        auth_basic_user_file /etc/nginx/.htpasswd;
        fastcgi_pass unix:${SOCK};
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }

    access_log /var/log/nginx/${name}.access.log;
    error_log /var/log/nginx/${name}.error.log;
}
EOF

  # Aktifkan
  ln -sf /etc/nginx/sites-available/${domain} /etc/nginx/sites-enabled/
}

# 7️⃣ Jalankan untuk semua worker
setup_worker "galadriel" 8004
setup_worker "celeborn" 8005
setup_worker "oropher" 8006

# 8️⃣ Tes & reload nginx
echo ""
echo "[+] Mengecek konfigurasi nginx..."
nginx -t

if [ $? -eq 0 ]; then
  echo "[+] Reload nginx..."
  nginx -s reload
  echo "✅ Semua taman Peri telah diamankan dengan Basic Auth!"
else
  echo "❌ Terdapat kesalahan pada konfigurasi nginx!"
  exit 1
fi

echo ""
echo "=============================================="
echo "   ✨ TAMAN PERI SUDAH TERLINDUNGI ✨"
echo "=============================================="
echo "Gunakan login: noldor / silvan"
echo ""
echo "Uji akses dengan:"
echo "  curl -u noldor:silvan http://galadriel.k02.com:8004/"
echo "  curl -u noldor:silvan http://celeborn.k02.com:8005/"
echo "  curl -u noldor:silvan http://oropher.k02.com:8006/"
COBA Di galadriel, celeborn, oropher
nano soal14.sh
Jadikan executable:
chmod +x soal14.sh
Jalankan:
bash soal14.sh