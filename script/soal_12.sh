
#!/bin/bash
# =============================================
# Soal 12 - Para Penguasa Peri (Galadriel, Celeborn, Oropher)
# Setup Nginx + PHP 8.4-FPM dan Virtual Host
# =============================================

# Pastikan user memasukkan hostname (misal galadriel, celeborn, oropher)
if [ $# -ne 1 ]; then
  echo "Usage: bash $0 <hostname>"
  echo "Contoh: bash $0 galadriel"
  exit 1
fi

HOSTNAME=$1

echo "=== [1/6] Mengupdate & menginstal Nginx dan PHP 8.4-FPM ==="
apt update -y
apt install -y nginx php8.4-fpm

echo "=== [2/6] Menjalankan service nginx & php-fpm ==="
service nginx start
service php8.4-fpm start

echo "=== [3/6] Membuat file index.php dengan nama hostname ==="
mkdir -p /var/www/html
echo "<?php echo 'Halo, saya ${HOSTNAME^} 🌸'; ?>" > /var/www/html/index.php
cat /var/www/html/index.php

echo "=== [4/6] Membuat konfigurasi virtual host untuk ${HOSTNAME}.k02.com ==="
cat > /etc/nginx/sites-available/${HOSTNAME}.k02.com <<EOF
server {
    listen 80;
    server_name ${HOSTNAME}.k02.com;

    root /var/www/html;
    index index.php index.html index.htm;

    # Blok akses langsung via IP
    if (\$host ~* ^\d+\.\d+\.\d+\.\d+$) {
        return 444;
    }

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    access_log /var/log/nginx/${HOSTNAME}.access.log;
    error_log /var/log/nginx/${HOSTNAME}.error.log;
}
EOF

echo "=== [5/6] Mengaktifkan virtual host ${HOSTNAME}.k02.com ==="
ln -sf /etc/nginx/sites-available/${HOSTNAME}.k02.com /etc/nginx/sites-enabled/${HOSTNAME}.k02.com

echo "=== [6/6] Mengecek konfigurasi dan reload Nginx ==="
nginx -t && service nginx reload

echo "=== Setup selesai! ==="
echo "Sekarang kamu bisa mengakses:"
echo "  http://${HOSTNAME}.k02.com"
echo ""
echo "Pastikan domain tersebut diarahkan ke IP node ini (via /etc/hosts)."
echo "Contoh:"
echo "  echo '127.0.0.1 ${HOSTNAME}.k02.com' >> /etc/hosts"
echo ""
echo "Tes akses:"
echo "  curl http://${HOSTNAME}.k02.com"
COBA Di galadriel, celeborn, oropher
nano soal12.sh
Beri Izin Eksekusi:

chmod +x soal12.sh
Jalankan untuk masing-masing node:
bash soal12.sh galadriel
bash soal12.sh celeborn
bash soal12.sh oropher