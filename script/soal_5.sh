Erendis
#!/bin/bash
# === [UPDATE DNS MASTER - ERENDIS untuk Soal 5] ===

echo "=== [1/4] Update Zone File dengan Alias dan TXT Records ==="
cat > /etc/bind/zones/db.k02.com << 'EOF'
;
; BIND data file for k02.com
;
$TTL    604800
@       IN      SOA     ns1.k02.com. admin.k02.com. (
                        2024103002      ; Serial (increment untuk update)
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

; Alias untuk domain utama
www     IN      CNAME   @               ; www.k02.com → k02.com
@       IN      A       192.212.3.3     ; Default A record untuk k02.com

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

; TXT Records - Pesan Rahasia
cincinsauron        IN  TXT "Cincin Sauron"
cincinsauron        IN  A   192.212.1.6     ; Menunjuk ke Elros
aliansiterakhir     IN  TXT "Aliansi Terakhir"
aliansiterakhir     IN  A   192.212.2.4     ; Menunjuk ke Pharazon
EOF

echo "=== [2/4] Konfigurasi Reverse Zone untuk subnet 192.212.3.0/24 ==="
# Cek apakah zone sudah ada untuk mencegah duplikasi
if ! grep -q '3.212.192.in-addr.arpa' /etc/bind/named.conf.local; then
cat >> /etc/bind/named.conf.local << 'EOF'

zone "3.212.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/db.192.212.3";
    allow-transfer { 192.212.3.4; };  // Izinkan transfer ke Amdir
    also-notify { 192.212.3.4; };      // Notifikasi otomatis ke Amdir
};
EOF
    echo "→ Reverse zone baru ditambahkan ke named.conf.local"
else
    echo "→ Reverse zone 3.212.192.in-addr.arpa sudah ada, skip penambahan."
fi

echo "=== [3/4] Buat Reverse Zone File ==="
cat > /etc/bind/zones/db.192.212.3 << 'EOF'
;
; BIND reverse data file for 192.212.3.0/24
;
$TTL    604800
@       IN      SOA     ns1.k02.com. admin.k02.com. (
                        2024103001      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name Servers
@       IN      NS      ns1.k02.com.
@       IN      NS      ns2.k02.com.

; PTR Records
3       IN      PTR     ns1.k02.com.    ; 192.212.3.3 → Erendis
4       IN      PTR     ns2.k02.com.    ; 192.212.3.4 → Amdir
95      IN      PTR     khamul.k02.com. ; 192.212.3.95 → Khamul
EOF

echo "=== [4/4] Restart BIND9 ==="
# Hentikan proses named lama jika ada
pkill -9 named 2>/dev/null
sleep 1

# Cek syntax konfigurasi
named-checkconf /etc/bind/named.conf
if [ $? -eq 0 ]; then
    echo "✓ Config syntax OK"
else
    echo "✗ Config syntax ERROR"
    exit 1
fi

# Cek zone file
named-checkzone k02.com /etc/bind/zones/db.k02.com
named-checkzone 3.212.192.in-addr.arpa /etc/bind/zones/db.192.212.3

# Jalankan BIND9
named -u bind -c /etc/bind/named.conf
sleep 2

# Pastikan BIND9 berjalan
if ps aux | grep -v grep | grep named > /dev/null; then
    echo "✓ BIND9 (named) is running"
    ps aux | grep named | grep -v grep
else
    echo "✗ BIND9 failed to start"
    exit 1
fi

echo ""
echo "✅ DNS Master (Erendis) berhasil diupdate untuk Soal 5."
Amdir
#!/bin/bash
# === [UPDATE DNS SLAVE - AMDIR untuk Soal 5] ===

echo "=== [1/3] Update named.conf.local untuk Reverse Zone ==="
cat > /etc/bind/named.conf.local << 'EOF'
zone "k02.com" {
    type slave;
    file "/var/cache/bind/db.k02.com";
    masters { 192.212.3.3; };  // IP Erendis (DNS Master)
};

zone "3.212.192.in-addr.arpa" {
    type slave;
    file "/var/cache/bind/db.192.212.3";
    masters { 192.212.3.3; };  // IP Erendis (DNS Master)
};
EOF

echo "=== [2/3] Restart BIND9 ==="
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
echo "=== [3/3] Cek Zone Transfer ==="
sleep 3

if [ -f /var/cache/bind/db.k02.com ]; then
    echo "✓ Forward zone berhasil di-transfer"
    ls -lh /var/cache/bind/db.k02.com
fi

if [ -f /var/cache/bind/db.192.212.3 ]; then
    echo "✓ Reverse zone berhasil di-transfer"
    ls -lh /var/cache/bind/db.192.212.3
fi

echo ""
echo "✅ DNS Slave (Amdir) berhasil diupdate untuk Soal 5."
echo ""