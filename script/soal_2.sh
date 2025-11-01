Aldarion
#!/bin/bash
# === [SETUP DHCP SERVER - ALDARION] ===

echo "=== [1/4] Update & install dependencies ==="
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt update -y
apt install -y isc-dhcp-server procps

echo "=== [2/4] Konfigurasi interface DHCP ==="
cat > /etc/default/isc-dhcp-server << 'EOF'
# Interface yang dilayani DHCP Server
INTERFACESv4="eth0"
INTERFACESv6=""
EOF

echo "=== [3/4] Konfigurasi DHCP Server ==="
cat > /etc/dhcp/dhcpd.conf << 'EOF'
# Konfigurasi umum
option domain-name "k02.com";
option domain-name-servers 192.212.4.3;  # Erendis (DNS Master)
default-lease-time 600;
max-lease-time 7200;
authoritative;

# Subnet 1: Client Dinamis Keluarga Manusia (Amandil)
# Range: 192.212.1.6-34 dan 192.212.1.68-94
subnet 192.212.1.0 netmask 255.255.255.0 {
    range 192.212.1.6 192.212.1.34;
    range 192.212.1.68 192.212.1.94;
    option routers 192.212.1.1;
    option broadcast-address 192.212.1.255;
    option domain-name-servers 192.212.4.3;
}

# Subnet 2: Client Dinamis Keluarga Peri (Gilgalad)
# Range: 192.212.2.35-67 dan 192.212.2.96-121
subnet 192.212.2.0 netmask 255.255.255.0 {
    range 192.212.2.35 192.212.2.67;
    range 192.212.2.96 192.212.2.121;
    option routers 192.212.2.1;
    option broadcast-address 192.212.2.255;
    option domain-name-servers 192.212.4.3;
}

# Subnet 3: Client Fixed Address (Khamul)
# Hanya untuk fixed address, TIDAK ADA range dinamis
subnet 192.212.3.0 netmask 255.255.255.0 {
    option routers 192.212.3.1;
    option broadcast-address 192.212.3.255;
    option domain-name-servers 192.212.4.3;
}

# Subnet 4: Services (Aldarion, Erendis, Palantir, Narvi)
subnet 192.212.4.0 netmask 255.255.255.0 {
    option routers 192.212.4.1;
}

# Subnet lainnya (jika ada di topologi)
subnet 192.212.5.0 netmask 255.255.255.0 {
    option routers 192.212.5.1;
}

subnet 192.212.6.0 netmask 255.255.255.0 {
    option routers 192.212.6.1;
}

# Fixed Address untuk Khamul - IP tetap 192.212.3.95
host Khamul {
    hardware ethernet 02:42:67:5c:8c:00;
    fixed-address 192.212.3.95;
}
EOF

echo "=== [4/4] Restart DHCP Server ==="
service isc-dhcp-server stop >/dev/null 2>&1
pkill dhcpd >/dev/null 2>&1
rm -f /var/run/dhcpd.pid
service isc-dhcp-server start
sleep 2
service isc-dhcp-server status

echo ""
echo "✅ Setup DHCP Server (Aldarion) selesai."
Durin
#!/bin/bash
# === [SETUP DHCP RELAY - DURIN] ===

echo "=== [1/4] Install DHCP Relay ==="
apt update -y
apt install -y isc-dhcp-relay procps

echo "=== [2/4] Konfigurasi DHCP Relay ==="
cat > /etc/default/isc-dhcp-relay << 'EOF'
# DHCP Relay menuju Aldarion (192.212.4.2)
SERVERS="192.212.4.2"

# Interface yang dilayani (semua kecuali eth0/WAN)
INTERFACES="eth1 eth2 eth3 eth4 eth5"

# Options tambahan
OPTIONS=""
EOF

echo "=== [3/4] Konfigurasi IP Forwarding ==="
cat > /etc/sysctl.conf << 'EOF'
net.ipv4.ip_forward=1
EOF

# Terapkan konfigurasi sysctl
sysctl -p

echo "=== [4/4] Restart DHCP Relay ==="
service isc-dhcp-relay stop >/dev/null 2>&1
pkill dhcrelay >/dev/null 2>&1
service isc-dhcp-relay start
sleep 2
service isc-dhcp-relay status

echo ""
echo "✅ Setup DHCP Relay (Durin) selesai."
Amandil
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Gilgalad
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Khamul
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    hwaddress ether 02:42:67:5c:8c:00
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf