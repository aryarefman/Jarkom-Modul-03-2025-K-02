Elros
#!/bin/bash
# setup-elros-final.sh
# Setup LENGKAP Load Balancer Elros
# JALANKAN DI ELROS

echo "=========================================="
echo "  SETUP ELROS - LOAD BALANCER"
echo "=========================================="
echo ""

# 1. Update dan install nginx
echo "[1/5] Install Nginx"
apt-get update
apt-get install -y nginx curl dnsutils

# 2. Setup direktori log
echo "[2/5] Setup Direktori Log"
mkdir -p /var/log/nginx/
chmod 755 /var/log/nginx/

# 3. Backup konfigurasi lama
echo "[3/5] Backup Konfigurasi Lama"
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup 2>/dev/null

# 4. Buat konfigurasi upstream dan load balancer
echo "[4/5] Buat Konfigurasi Load Balancer"

# Hapus konfigurasi default
rm -f /etc/nginx/sites-enabled/default

# Buat konfigurasi baru
cat > /etc/nginx/sites-available/elros-lb << 'ELROS_CONFIG'
# Upstream definition untuk Round Robin
upstream kesatria_numenor {
    server elendil.k02.com:8001;
    server isildur.k02.com:8002;
    server anarion.k02.com:8003;
}

# Log format untuk tracking upstream
log_format upstreamlog '$remote_addr - $remote_user [$time_local] '
                       '"$request" $status $body_bytes_sent '
                       '"$http_referer" "$http_user_agent" '
                       'upstream: $upstream_addr';

# Server block - blokir akses via IP
server {
    listen 80 default_server;
    server_name ~^192\.;
    
    return 444;
}

# Server block - handle domain elros.k02.com
server {
    listen 80;
    server_name elros.k02.com;
    
    access_log /var/log/nginx/elros-access.log upstreamlog;
    error_log /var/log/nginx/elros-error.log;

    # Proxy settings
    proxy_http_version 1.1;
    proxy_set_header Connection "";

    location / {
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
ELROS_CONFIG

# Aktifkan konfigurasi
ln -sf /etc/nginx/sites-available/elros-lb /etc/nginx/sites-enabled/elros-lb

echo "✓ Konfigurasi dibuat di /etc/nginx/sites-available/elros-lb"

# 5. Test dan start nginx
echo "[5/5] Test dan Start Nginx"
nginx -t
if [ $? -eq 0 ]; then
    service nginx stop 2>/dev/null
    sleep 1
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
echo "=========================================="
echo "  SETUP SELESAI"
echo "=========================================="
echo ""
echo "Elros Load Balancer Configuration:"
echo "  Domain: elros.k02.com"
echo "  Upstream:"
echo "    - elendil.k02.com:8001"
echo "    - isildur.k02.com:8002"
echo "    - anarion.k02.com:8003"
echo "  Algorithm: Round Robin"
echo ""
echo "Testing Load Balancer:"
echo "  curl http://elros.k02.com/api/airing"
echo ""
echo "Melihat distribusi:"
echo "  tail -30 /var/log/nginx/elros-access.log | grep -oE '(elendil|isildur|anarion)' | sort | uniq -c"
echo ""
echo "=========================================="
Elendil
#!/bin/bash
echo "=== FIXING ELENDIL PORT 8001 ==="

# 1. Flush firewall completely
echo "[1] Flushing firewall..."
iptables -F
iptables -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# 2. Cek nginx config
echo ""
echo "[2] Nginx config check..."
nginx -t

# 3. Cek apakah nginx listening di port 8001
echo ""
echo "[3] Port 8001 status:"
ss -tulpn | grep :8001 || echo "✗ Port 8001 NOT listening!"

# 4. Cek nginx process
echo ""
echo "[4] Nginx process:"
ps aux | grep nginx | grep -v grep || echo "✗ Nginx NOT running!"

# 5. Restart services
echo ""
echo "[5] Restarting services..."
service php8.2-fpm restart
service nginx stop
sleep 2
service nginx start
sleep 2

# 6. Verify port again
echo ""
echo "[6] Port 8001 status after restart:"
ss -tulpn | grep :8001

# 7. Test localhost
echo ""
echo "[7] Testing localhost:8001..."
curl -v http://localhost:8001/api/airing 2>&1 | head -30

# 8. Test from IP
echo ""
echo "[8] Testing via IP..."
MY_IP=$(hostname -I | awk '{print $1}')
curl -v http://$MY_IP:8001/api/airing 2>&1 | head -30