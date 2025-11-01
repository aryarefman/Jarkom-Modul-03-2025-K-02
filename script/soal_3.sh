Minastir
#!/bin/bash
# === [SETUP DNS FORWARDER - MINASTIR] ===

echo "=== [1/4] Install BIND9 ==="
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt update -y
apt install -y bind9 bind9utils bind9-dnsutils procps

echo "=== [2/4] Konfigurasi named.conf.options ==="
cat > /etc/bind/named.conf.options << 'EOF'
options {
    directory "/var/cache/bind";
    allow-query { any; };
    forwarders { 192.168.122.1; };
    recursion yes;
    dnssec-validation auto;
    listen-on-v6 { any; };
};
EOF

echo "=== [3/4] Jalankan BIND9 ==="
pkill named 2>/dev/null
nohup named -c /etc/bind/named.conf -u bind > /var/log/named.log 2>&1 &
sleep 2
ps aux | grep named

echo ""
echo "✅ DNS Forwarder (Minastir) telah berhasil dikonfigurasi."
Semua Node selain Durin dan Minastir
ubah up echo "nameserver 192.168.122.1" > /etc/resolv.conf jadi up echo "nameserver 192.212.5.2" > /etc/resolv.conf