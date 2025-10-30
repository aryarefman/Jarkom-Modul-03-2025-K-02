# Lapres Jarkom Modul 3 Kelompok K-02

| Nama | NRP |
| ---------------------- | ---------- |
| Nadia Kirana Afifah Prahandita | 5027241005 |
| Arya Bisma Putra Refman | 5027241036 |
----

# IP Address Host : 10.15.43.32

# The Last Alliance Gathers
Bayangan dari timur memanjang, lebih gelap dari malam tanpa bintang. Di Lindon, Gilgalad merasakan angin dingin yang tak biasa merayapi menaranya. Panji biru dan peraknya berkibar gelisah, seolah tahu badai api akan segera datang. Ia menggenggam tombaknya, Aeglos, merasakan tanggung jawab sebagai Raja Tertinggi menekan bahunya. Di selatan, Elendil, yang baru saja membangun kerajaannya dari puing-puing kenangan Númenor yang tenggelam, menatap ke arah Mordor. Pedangnya, Narsil, yang belum patah, berkilauan di sisinya, memantulkan tekad pahit seorang penyintas.
Putra-putranya, Isildur dan Anarion, memeriksa baju zirah mereka di Osgiliath. Darah muda mendidih, namun mata mereka menyimpan bayangan laut yang menelan tanah air mereka. Di pegunungan yang menjulang, Durin di Khazad-dûm mendengar panggilan terompet perang. Kapak-kapak mulai diasah, dan gema langkah kaki para Kurcaci mengguncang akar gunung.
Di Greenwood yang luas, Oropher mengumpulkan pasukan Silvan-nya. Hutan terasa menahan napas, daun-daun emasnya bergetar bukan karena angin. Di Eregion yang telah lama sunyi, Celebrimbor hanyalah nama dalam legenda, namun Tiga Cincin yang dibuatnya masih bersinar di jari-jari Galadriel dan Gilgalad, berdenyut dengan kewaspadaan. Galadriel dan Celeborn di Lórien merasakan kekuatan gelap mengumpul seperti awan badai.
Bahkan para worker, Elendil, Isildur, Anárion, Galadriel, Celeborn, Oropher, merasakan energi yang berbeda mengalir melalui node mereka, sebuah perintah yang lebih besar sedang dijalankan. Para client, Miriel, Amandil, Gilgalad, Celebrimbor, menanti dengan cemas di balik benteng-benteng baru. Aldarion (DHCP Server) mulai mengalokasikan sumber daya terakhir, sementara Erendis (DNS Master) memastikan semua nama dan tujuan tercatat dengan benar sebelum kekacauan dimulai. Dan di Mordor, menara Barad-dûr menjulang, gelap dan mengancam, seolah mata tanpa kelopak sedang mengawasi mereka semua, menunggu. Zaman Kedua baru saja menarik napas terakhirnya sebelum terjun ke dalam api perang.

<img width="618" height="476" alt="image" src="https://github.com/user-attachments/assets/111c1f1f-358d-4424-85cf-d2733ad2d433" />

Glosarium untuk Soal Praktikum Modul 3 :
| Node | Kategori | Image Docker | Konfigurasi IP | Keluarga Kerajaan |
| ---------------- | ------------------------ | ------------------------ | ---------------- | ---------------- |
| Durin | Router (DHCP Relay) | nevarre/gns3-debi:new | Dynamic | Kurcaci (Dwarf) |
| Minastir | Forward Proxy | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Aldarion | DHCP Server | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Erendis | DNS Master | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Amdir | DNS Slave | nevarre/gns3-debi:new | Static | Peri (Elf) |
| Palantir | Database Server | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Narvi | Database Slave | nevarre/gns3-debi:new | Static | Kurcaci (Dwarf) |
| Elros | Load Balancer (Laravel) | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Pharazon | Load Balancer (PHP) | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Elendil | Laravel Worker-1 | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Isildur | Laravel Worker-2 | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Anarion | Laravel Worker-3 | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Galadriel | PHP Worker-1 | nevarre/gns3-debi:new | Static | Peri (Elf) |
| Celeborn | PHP Worker-2 | nevarre/gns3-debi:new | Static | Peri (Elf) |
| Oropher | PHP Worker-3 | nevarre/gns3-debi:new | Static | Peri (Elf) |
| Miriel | Client-Static-1 | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
| Celebrimbor | Client-Static-2 | nevarre/gns3-debi:new | Static | Peri (Elf) |
| Gilgalad | Client-Dynamic-1 | nevarre/gns3-debi:new | Dynamic | Peri (Elf) |
| Amandil | Client-Dynamic-2 | nevarre/gns3-debi:new | Dynamic | Manusia (Numenor) |
| Khamul | Client-Fixed-Address | nevarre/gns3-debi:new | Fixed Address | Manusia (Numenor) |

Persyaratan Pengerjaan
- Aturan resolver awal : setiap tokoh (host) non-router menambahkan nameserver 192.168.122.1 saat UI aktif (untuk memudahkan akses & instalasi paket yang dibutuhkan di awal).
- `<xxxx>` : Isi dengan nama kelompok, contoh: K01.
- [prefix ip] : Isi dengan prefix ip yang sudah dibagi masing-masing pada mastersheet praktikan.
- Disarankan menggunakan php8.4-fpm.
- Gunakan nginx untuk setiap web.
- Gunakan lynx, curl, dan ping untuk mengecek setiap domain web.
- Gunakan htop untuk memverifikasi resource yang terpakai.

## Soal_1
Di awal Zaman Kedua, setelah kehancuran Beleriand, para Valar menugaskan untuk membangun kembali jaringan komunikasi antar kerajaan. Para Valar menyalakan Minastir, Aldarion, Erendis, Amdir, Palantir, Narvi, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, Oropher, Miriel, Amandil, Gilgalad, Celebrimbor, Khamul, dan pastikan setiap node (selain Durin sang penghubung antar dunia) dapat sementara berkomunikasi dengan Valinor/Internet (nameserver 192.168.122.1) untuk menerima instruksi awal.

### SCRIPT
#### Durin
```
auto lo
iface lo inet loopback

# WAN (ke NAT)
auto eth0
iface eth0 inet dhcp

# Switch1 - Laravel Workers
auto eth1
iface eth1 inet static
    address 192.212.1.1
    netmask 255.255.255.0

# Switch2 - PHP Workers
auto eth2
iface eth2 inet static
    address 192.212.2.1
    netmask 255.255.255.0

# Switch5 - Clients (Khamul, Erendis, Amdir via Switch8→Switch6)
auto eth3
iface eth3 inet static
    address 192.212.3.1
    netmask 255.255.255.0

# Switch4 - Services (Aldarion, Palantir, Narvi)
auto eth4
iface eth4 inet static
    address 192.212.4.1
    netmask 255.255.255.0

# Minastir (Direct Connection)
auto eth5
iface eth5 inet static
    address 192.212.5.1
    netmask 255.255.255.0
```

- /root/.bashrc
```
apt update
apt install -y procps iptables

# Aktifkan IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# Bersihkan aturan lama agar tidak duplikat
iptables -F
iptables -t nat -F

# NAT ke Internet melalui eth0 (interface WAN)
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Loop untuk semua interface internal (eth1–eth5)
for i in eth1 eth2 eth3 eth4 eth5; do
    # Izinkan trafik dari LAN ke Internet
    iptables -A FORWARD -i $i -o eth0 -j ACCEPT
    # Izinkan trafik balik dari Internet ke LAN jika sudah established
    iptables -A FORWARD -i eth0 -o $i -m state --state RELATED,ESTABLISHED -j ACCEPT
done
```

#### Elendil
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.2
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Isildur
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.3
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Anarion
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.4
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Gigalad
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.2
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Celebrimbor
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.3
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Pharazon
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.4
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Aldarion
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.4.2
    netmask 255.255.255.0
    gateway 192.212.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Palantir
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.4.3
    netmask 255.255.255.0
    gateway 192.212.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Narvi
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.4.4
    netmask 255.255.255.0
    gateway 192.212.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Miriel
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.5
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Amandil
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.7
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Elros
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.6
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Khamul
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.3.2
    netmask 255.255.255.0
    gateway 192.212.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Erendis
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.3.3
    netmask 255.255.255.0
    gateway 192.212.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Amdir
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.3.4
    netmask 255.255.255.0
    gateway 192.212.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Galadriel
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.5
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Celeborn
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.6
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Oropher
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.7
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Minastir
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.5.2
    netmask 255.255.255.0
    gateway 192.212.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### UJI
#### Semua Node selain Durin (Contoh: Isildur)
<img width="1128" height="506" alt="image" src="https://github.com/user-attachments/assets/3ad9eb68-09b7-4000-a89c-e171d2dd0d9e" />

## Soal_2
Raja Pelaut Aldarion, penguasa wilayah Númenor, memutuskan cara pembagian tanah client secara dinamis. Ia menetapkan:
- Client Dinamis Keluarga Manusia: Mendapatkan tanah di rentang `[prefix ip].1.6` - `[prefix ip].1.34` dan `[prefix ip].1.68` - `[prefix ip].1.94`.
- Client Dinamis Keluarga Peri: Mendapatkan tanah di rentang `[prefix ip].2.35` - `[prefix ip].2.67` dan `[prefix ip].2.96` - `[prefix ip].2.121`.
- Khamul yang misterius: Diberikan tanah tetap di `[prefix ip].3.95`, agar keberadaannya selalu diketahui. Pastikan Durin dapat menyampaikan dekrit ini ke semua wilayah yang terhubung dengannya.

### SCRIPT
#### Aldarion
```
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
```

#### Durin
```
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
```

#### Amandil
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Gilgalad
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Khamul
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    hwaddress ether 02:42:67:5c:8c:00
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### UJI
#### Amandil
<img width="1561" height="871" alt="image" src="https://github.com/user-attachments/assets/4fbe3fd0-d145-45fa-b7ef-a3974dd0b219" />

#### Gilgalad
<img width="1555" height="873" alt="image" src="https://github.com/user-attachments/assets/9c259df6-3e74-49cd-b83e-828e60dbd046" />

#### Khamul
<img width="1564" height="867" alt="image" src="https://github.com/user-attachments/assets/db0fc4cb-9515-4475-9448-2e090a01a7d9" />
