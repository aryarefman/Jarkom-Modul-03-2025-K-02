Erendis
#!/bin/bash
# === [SETUP DNS MASTER - ERENDIS] ===

echo "=== [0/5] Fix DNS Resolution ==="
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "=== [1/5] Install BIND9 ==="
apt update -y
apt install -y bind9 bind9-utils bind9-dnsutils procps

echo "=== [2/5] Konfigurasi named.conf.options ==="
cat > /etc/bind/named.conf.options << 'EOF'
options {
    directory "/var/cache/bind";
    allow-query { any; };
    allow-transfer { 192.212.3.4; };  // IP Amdir (DNS Slave)
    also-notify { 192.212.3.4; };      // Notifikasi ke Amdir
    forwarders { 192.212.5.2; };       // Minastir sebagai forwarder
    dnssec-validation auto;
    listen-on-v6 { any; };
};
EOF

echo "=== [3/5] Konfigurasi named.conf.local ==="
cat > /etc/bind/named.conf.local << 'EOF'
zone "k02.com" {
    type master;
    file "/etc/bind/zones/db.k02.com";
    allow-transfer { 192.212.3.4; };  // Izinkan transfer ke Amdir
    also-notify { 192.212.3.4; };      // Notifikasi otomatis ke Amdir
};
EOF

echo "=== [4/5] Buat Zone File ==="
mkdir -p /etc/bind/zones

cat > /etc/bind/zones/db.k02.com << 'EOF'
;
; BIND data file for k02.com
;
$TTL    604800
@       IN      SOA     ns1.k02.com. admin.k02.com. (
                        2024103001      ; Serial (YYYYMMDDNN)
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name Servers
@       IN      NS      ns1.k02.com.
@       IN      NS      ns2.k02.com.

; A Records untuk Name Servers
ns1     IN      A       192.212.3.3     ; Erendis (DNS Master)
ns2     IN      A       192.212.3.4     ; Amdir (DNS Slave)

; A Records untuk Services
palantir    IN  A       192.212.4.3     ; Database Server
narvi       IN  A       192.212.4.4     ; Database Slave
elros       IN  A       192.212.1.6     ; Load Balancer Laravel
pharazon    IN  A       192.212.2.4     ; Load Balancer PHP

; A Records untuk Laravel Workers
elendil     IN  A       192.212.1.2     ; Laravel Worker-1
isildur     IN  A       192.212.1.3     ; Laravel Worker-2
anarion     IN  A       192.212.1.4     ; Laravel Worker-3

; A Records untuk PHP Workers
galadriel   IN  A       192.212.2.5     ; PHP Worker-1
celeborn    IN  A       192.212.2.6     ; PHP Worker-2
oropher     IN  A       192.212.2.7     ; PHP Worker-3

; A Records untuk Clients
miriel      IN  A       192.212.1.5     ; Client Static-1
celebrimbor IN  A       192.212.2.3     ; Client Static-2
khamul      IN  A       192.212.3.95    ; Client Fixed Address
EOF

echo "=== [5/5] Start BIND9 dengan named ==="
# Kill proses named yang mungkin masih jalan
pkill -9 named 2>/dev/null
sleep 1

# Cek syntax config
named-checkconf /etc/bind/named.conf
if [ $? -eq 0 ]; then
    echo "✓ Config syntax OK"
else
    echo "✗ Config syntax ERROR"
    exit 1
fi

# Cek zone file
named-checkzone k02.com /etc/bind/zones/db.k02.com
if [ $? -eq 0 ]; then
    echo "✓ Zone file OK"
else
    echo "✗ Zone file ERROR"
    exit 1
fi

# Start named
named -u bind -c /etc/bind/named.conf
sleep 2

# Cek apakah named jalan
if ps aux | grep -v grep | grep named > /dev/null; then
    echo "✓ BIND9 (named) is running"
    ps aux | grep named | grep -v grep
else
    echo "✗ BIND9 failed to start"
    exit 1
fi

echo ""
echo "✅ DNS Master (Erendis) berhasil dikonfigurasi."
echo ""
Amdir
#!/bin/bash
# === [SETUP DNS SLAVE - AMDIR] ===

echo "=== [0/5] Fix DNS Resolution ==="
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "=== [1/5] Install BIND9 ==="
apt update -y
apt install -y bind9 bind9-utils bind9-dnsutils procps

echo "=== [2/5] Konfigurasi named.conf.options ==="
cat > /etc/bind/named.conf.options << 'EOF'
options {
    directory "/var/cache/bind";
    allow-query { any; };
    forwarders { 192.212.5.2; };  // Minastir sebagai forwarder
    dnssec-validation auto;
    listen-on-v6 { any; };
};
EOF

echo "=== [3/5] Konfigurasi named.conf.local ==="
cat > /etc/bind/named.conf.local << 'EOF'
zone "k02.com" {
    type slave;
    file "/var/cache/bind/db.k02.com";
    masters { 192.212.3.3; };  // IP Erendis (DNS Master)
};
EOF

echo "=== [4/5] Buat direktori cache ==="
mkdir -p /var/cache/bind
chown bind:bind /var/cache/bind
chmod 755 /var/cache/bind

echo "=== [5/5] Start BIND9 dengan named ==="
# Kill proses named yang mungkin masih jalan
pkill -9 named 2>/dev/null
sleep 1

# Cek syntax config
named-checkconf /etc/bind/named.conf
if [ $? -eq 0 ]; then
    echo "✓ Config syntax OK"
else
    echo "✗ Config syntax ERROR"
    exit 1
fi

# Start named
named -u bind -c /etc/bind/named.conf
sleep 3

# Cek apakah named jalan
if ps aux | grep -v grep | grep named > /dev/null; then
    echo "✓ BIND9 (named) is running"
    ps aux | grep named | grep -v grep
else
    echo "✗ BIND9 failed to start"
    exit 1
fi

echo ""
echo "=== Cek Zone Transfer dari Master ==="
sleep 2
if [ -f /var/cache/bind/db.k02.com ]; then
    echo "✓ Zone file berhasil di-transfer dari Master"
    ls -lh /var/cache/bind/db.k02.com
    echo ""
    echo "Isi zone file:"
    cat /var/cache/bind/db.k02.com
else
    echo "✗ Zone transfer belum berhasil, tunggu beberapa detik..."
    sleep 3
    if [ -f /var/cache/bind/db.k02.com ]; then
        echo "✓ Zone file berhasil di-transfer"
        ls -lh /var/cache/bind/db.k02.com
    else
        echo "⚠ Zone transfer mungkin belum selesai"
    fi
fi

echo ""
echo "✅ DNS Slave (Amdir) berhasil dikonfigurasi."
echo ""
Semua Node selain Durin dan Minastir
ubah up echo "nameserver 192.212.5.2" > /etc/resolv.conf jadi up echo "nameserver 192.212.3.3" > /etc/resolv.conf dan up echo "nameserver 192.212.3.4" >> /etc/resolv.conf