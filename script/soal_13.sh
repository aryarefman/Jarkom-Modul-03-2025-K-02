#!/bin/bash
# =======================================================
# SOAL 13 - Konfigurasi Nginx dan PHP-FPM untuk Taman Peri
# Setiap taman (Galadriel, Celeborn, Oropher) mendengarkan
# di port berbeda: 8004, 8005, dan 8006
# =======================================================

# Pastikan script dijalankan sebagai root
if [ "$EUID" -ne 0 ]; then
  echo "Harap jalankan script ini sebagai root!"
  exit
fi

echo "=============================================="
echo "     ⚙️  KONFIGURASI TAMAN PERI DIMULAI"
echo "=============================================="

# Pastikan nginx dan php-fpm sudah terpasang
echo "[+] Memastikan nginx dan php8.4-fpm terpasang..."
apt update -y
apt install -y nginx php8.4-fpm

# Cek versi socket PHP-FPM yang tersedia
php_sock=$(find /var/run/php/ -name "php*-fpm.sock" | head -n1)
if [ -z "$php_sock" ]; then
  echo "❌ Tidak ditemukan socket php-fpm di /var/run/php/"
  exit 1
else
  echo "[+] Socket PHP-FPM ditemukan: $php_sock"
fi

# Menonaktifkan konfigurasi default
echo "[+] Menghapus konfigurasi default nginx..."
rm -f /etc/nginx/sites-enabled/default

# Fungsi pembuat konfigurasi per-host
setup_worker() {
  local name=$1
  local port=$2
  local domain="${name}.k02.com"
  local webroot="/var/www/${domain}"

  echo ""
  echo "----------------------------------------------"
  echo "[+] Membuat konfigurasi untuk ${domain} (port ${port})"
  echo "----------------------------------------------"

  # Membuat root web
  mkdir -p ${webroot}
  echo "<?php echo 'Halo, aku adalah ${name}! Hostname: ' . gethostname(); ?>" > ${webroot}/index.php
  chown -R www-data:www-data ${webroot}

  # Membuat file konfigurasi nginx
  cat > /etc/nginx/sites-available/${domain} << EOF
server {
    listen ${port};
    server_name ${domain};

    root ${webroot};
    index index.php index.html index.htm;

    # Blok akses via IP langsung
    if (\$host ~* ^\d+\.\d+\.\d+\.\d+$) {
        return 444;
    }

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:${php_sock};
    }

    location ~ /\.ht {
        deny all;
    }

    access_log /var/log/nginx/${name}.access.log;
    error_log /var/log/nginx/${name}.error.log;
}
EOF

  # Aktifkan site
  ln -sf /etc/nginx/sites-available/${domain} /etc/nginx/sites-enabled/
}

# Membuat konfigurasi untuk tiap worker
setup_worker "galadriel" 8004
setup_worker "celeborn" 8005
setup_worker "oropher" 8006

# Mengecek konfigurasi nginx
echo ""
echo "[+] Mengecek konfigurasi nginx..."
nginx -t

# Reload nginx jika tidak ada error
if [ $? -eq 0 ]; then
  echo "[+] Reload nginx..."
  service nginx reload || systemctl reload nginx
  echo "✅ Semua taman Peri telah dikonfigurasi dengan benar!"
else
  echo "❌ Terdapat kesalahan pada konfigurasi nginx. Periksa output di atas."
  exit 1
fi

echo ""
echo "=============================================="
echo "   ✨ SEMUA TAMAN PERI SIAP DIAKSES ✨"
echo "=============================================="
echo "Untuk menguji:"
echo "  echo '127.0.0.1 galadriel.k02.com celeborn.k02.com oropher.k02.com' >> /etc/hosts"
echo "  curl galadriel.k02.com:8004"
echo "  curl celeborn.k02.com:8005"
echo "  curl oropher.k02.com:8006"
COBA Di galadriel, celeborn, oropher
nano soal13.sh
Jalankan
bash soal13.sh