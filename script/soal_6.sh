Aldarion
#!/bin/bash
# === [UPDATE DHCP SERVER - ALDARION untuk Soal 6] ===

echo "=== [1/2] Update Konfigurasi DHCP dengan Lease Time ==="
cat > /etc/dhcp/dhcpd.conf << 'EOF'
# Konfigurasi umum
option domain-name "k02.com";
option domain-name-servers 192.212.3.3;  # Erendis (DNS Master)
default-lease-time 600;
max-lease-time 3600;  # Maksimal 1 jam untuk semua client
authoritative;

# Subnet 1: Client Dinamis Keluarga Manusia (Amandil)
# Range: 192.212.1.6-34 dan 192.212.1.68-94
# Lease time: 30 menit (1800 detik)
subnet 192.212.1.0 netmask 255.255.255.0 {
    range 192.212.1.6 192.212.1.34;
    range 192.212.1.68 192.212.1.94;
    option routers 192.212.1.1;
    option broadcast-address 192.212.1.255;
    option domain-name-servers 192.212.3.3;
    default-lease-time 1800;  # 30 menit untuk Keluarga Manusia
    max-lease-time 3600;       # Maksimal 1 jam
}

# Subnet 2: Client Dinamis Keluarga Peri (Gilgalad)
# Range: 192.212.2.35-67 dan 192.212.2.96-121
# Lease time: 10 menit (600 detik)
subnet 192.212.2.0 netmask 255.255.255.0 {
    range 192.212.2.35 192.212.2.67;
    range 192.212.2.96 192.212.2.121;
    option routers 192.212.2.1;
    option broadcast-address 192.212.2.255;
    option domain-name-servers 192.212.3.3;
    default-lease-time 600;    # 10 menit untuk Keluarga Peri
    max-lease-time 3600;        # Maksimal 1 jam
}

# Subnet 3: Client Fixed Address (Khamul)
# Hanya untuk fixed address, TIDAK ADA range dinamis
subnet 192.212.3.0 netmask 255.255.255.0 {
    option routers 192.212.3.1;
    option broadcast-address 192.212.3.255;
    option domain-name-servers 192.212.3.3;
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

echo "=== [2/2] Restart DHCP Server ==="
service isc-dhcp-server stop >/dev/null 2>&1
pkill dhcpd >/dev/null 2>&1
rm -f /var/run/dhcpd.pid
service isc-dhcp-server start
sleep 2
service isc-dhcp-server status

echo ""
echo "✅ DHCP Server (Aldarion) berhasil diupdate dengan lease time:"
echo "   - Keluarga Manusia (subnet 192.212.1.0): 1800 detik (30 menit)"
echo "   - Keluarga Peri (subnet 192.212.2.0): 600 detik (10 menit)"
echo "   - Max lease time semua: 3600 detik (1 jam)"
echo ""