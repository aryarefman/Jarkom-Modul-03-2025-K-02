#!/bin/bash
# =============================================================
# SOAL 15 - TAMAN PERI — LACAK PENGUNJUNG
# - Tambah header X-Real-IP ke fastcgi
# - Tampilkan IP pengunjung di index.php tiap webroot
# =============================================================

set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root!"
  exit 1
fi

echo "=============================================="
echo "     🌸 MENGAKTIFKAN PELACAK IP TAMAN PERI"
echo "=============================================="

# 1) Pastikan nginx & php-fpm terpasang
apt-get update -y >/dev/null 2>&1 || true
apt-get install -y nginx php8.4-fpm >/dev/null 2>&1

# 2) Temukan socket PHP-FPM
PHP_SOCK="$(find /run/php -type s -name "php*-fpm.sock" | head -n 1 || true)"
if [ -z "$PHP_SOCK" ]; then
  echo "❌ Tidak ditemukan socket PHP-FPM di /run/php. Pastikan php-fpm berjalan."
  exit 1
fi
echo "[+] Menggunakan socket PHP-FPM: $PHP_SOCK"

# 3) Tambah fastcgi_param X-Real-IP ke setiap konfigurasi yang relevan
SITES=(galadriel.k02.com celeborn.k02.com oropher.k02.com)
echo "[+] Menambahkan fastcgi_param X-Real-IP ke konfigurasi tiap taman (jika perlu)..."
for SITE in "${SITES[@]}"; do
  CONF="/etc/nginx/sites-available/${SITE}"
  if [ -f "$CONF" ]; then
    if ! grep -q "fastcgi_param X-Real-IP" "$CONF"; then
      sed -i '/fastcgi_pass/ i \        fastcgi_param X-Real-IP $remote_addr;' "$CONF"
      echo "    -> Ditambahkan ke ${SITE}"
    else
      echo "    -> Sudah ada di ${SITE}, dilewati."
    fi
  else
    echo "    -> Konfigurasi ${SITE} tidak ditemukan, dilewati."
  fi
done

# 4) Buat index.php cantik di setiap webroot
echo "[+] Membuat index.php di setiap taman untuk menampilkan IP..."
for SITE in "${SITES[@]}"; do
  WEBROOT="/var/www/${SITE}"
  mkdir -p "$WEBROOT"
  cat <<'EOF' > "${WEBROOT}/index.php"
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
    <p>Alamat IP Anda adalah:<br><b><?php echo $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR']; ?></b></p>
    <footer>🌿 Cahaya peri sedang memantau langkahmu 🌿</footer>
</div>
</body>
</html>
EOF
  chown -R www-data:www-data "$WEBROOT"
  chmod -R 755 "$WEBROOT"
  echo "    -> ${WEBROOT}/index.php dibuat"
done

# 5) Validasi konfigurasi nginx
echo "[+] Mengecek konfigurasi nginx..."
if ! nginx -t; then
  echo "❌ nginx -t gagal. Periksa konfigurasi sebelum reload."
  exit 1
fi

# 6) Reload nginx (tanpa systemd)
echo "[+] Reload nginx..."
if command -v systemctl >/dev/null 2>&1 && pidof systemd >/dev/null 2>&1; then
  systemctl reload nginx || nginx -s reload
else
  nginx -s reload
fi

echo "=============================================="
echo "   🌿 TAMAN PERI SUDAH BISA MELACAK PENGUNJUNG"
echo "=============================================="
echo "Uji dengan (pakai autentikasi basic):"
echo "  curl -u noldor:silvan http://galadriel.k02.com:8004/"
echo "  curl -u noldor:silvan http://celeborn.k02.com:8005/"
echo "  curl -u noldor:silvan http://oropher.k02.com:8006/"
echo
echo "Halaman index ada di: /var/www/<domain>/index.php"
echo "=============================================="
COBA Di galadriel, celeborn, oropher
nano soal5.sh
Jalankan :
bash soal15.sh