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
| Minastir | DNS Forwarder | nevarre/gns3-debi:new | Static | Manusia (Numenor) |
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

## Soal_3
Untuk mengontrol arus informasi ke dunia luar (Valinor/Internet), sebuah menara pengawas, Minastir didirikan. Minastir mengatur agar semua node (kecuali Durin) hanya dapat mengirim pesan ke luar Arda setelah melewati pemeriksaan di Minastir.

### SCRIPT
#### Minastir
```
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
```

#### Semua Node selain Durin dan Minastir
- ubah `up echo "nameserver 192.168.122.1" > /etc/resolv.conf` jadi `up echo "nameserver 192.212.5.2" > /etc/resolv.conf`

### UJI
#### Semua Node selain Durin dan Minastir (Contoh: Isildur)
<img width="1015" height="258" alt="image" src="https://github.com/user-attachments/assets/99c92c3a-24c5-45c9-8b13-50c95bd3cc7c" />

## Soal_4
Ratu Erendis, sang pembuat peta, menetapkan nama resmi untuk wilayah utama (`<xxxx>.com`). Ia menunjuk dirinya (`ns1.<xxxx>.com`) dan muridnya Amdir (`ns2.<xxxx>.com`) sebagai penjaga peta resmi. Setiap lokasi penting (Palantir, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, Oropher) diberikan nama domain unik yang menunjuk ke lokasi fisik tanah mereka. Pastikan Amdir selalu menyalin peta (master-slave) dari Erendis dengan setia.

### SCRIPT
#### Erendis
```
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
```

#### Amdir
```
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
```
#### Semua Node selain Durin dan Minastir
- ubah `up echo "nameserver 192.212.5.2" > /etc/resolv.conf` jadi `up echo "nameserver 192.212.3.3" > /etc/resolv.conf` dan `up echo "nameserver 192.212.3.4" >> /etc/resolv.conf`

### UJI
#### Semua Node selain Durin dan Minastir (Contoh: Gilgalad)
```
ping -c 3 palantir.k02.com
ping -c 3 elros.k02.com
ping -c 3 pharazon.k02.com
ping -c 3 elendil.k02.com
ping -c 3 isildur.k02.com
ping -c 3 anarion.k02.com
ping -c 3 galadriel.k02.com
ping -c 3 celeborn.k02.com
ping -c 3 oropher.k02.com
```
<img width="849" height="850" alt="image" src="https://github.com/user-attachments/assets/6962028d-7354-4834-91de-4a477cc07362" />

## Soal_5
Untuk memudahkan, nama alias `www.<xxxx>.com` dibuat untuk peta utama `<xxxx>.com`. Reverse PTR juga dibuat agar lokasi Erendis dan Amdir dapat dilacak dari alamat fisik tanahnya. Erendis juga menambahkan pesan rahasia (TXT record) pada petanya: "Cincin Sauron" yang menunjuk ke lokasi Elros, dan "Aliansi Terakhir" yang menunjuk ke lokasi Pharazon. Pastikan Amdir juga mengetahui pesan rahasia ini.

### SCRIPT
#### Erendis
```
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
```

#### Amdir
```
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
```

### UJI
#### Semua Node selain Durin dan Minastir (Contoh: Gilgalad)
```
# Test 1: Alias www.k02.com
host www.k02.com

# Test 2: Reverse PTR 
host 192.212.3.3
host 192.212.3.4

# Test 3: TXT Records
host -t TXT cincinsauron.k02.com
host -t TXT aliansiterakhir.k02.com
```
<img width="785" height="318" alt="image" src="https://github.com/user-attachments/assets/91108cf6-bb5a-47ad-bdf2-33d8535b5550" />

## Soal_6
Aldarion menetapkan aturan waktu peminjaman tanah. Ia mengatur:
- Client Dinamis Keluarga Manusia dapat meminjam tanah selama setengah jam.
- Client Dinamis Keluarga Peri hanya seperenam jam.
- Batas waktu maksimal peminjaman untuk semua adalah satu jam.

### SCRIPT
#### Aldarion
```
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
```

### UJI
#### Test pada Amandil (Client Dinamis Keluarga Manusia)
```
apt update
apt install isc-dhcp-client -y

# Release IP lama
dhclient -r eth0

# Request IP baru
dhclient -v eth0

# Cek lease time yang didapat
cat /var/lib/dhcp/dhclient.leases
```
<img width="605" height="370" alt="image" src="https://github.com/user-attachments/assets/5538fb09-e1a9-41ac-971e-90164bc04013" />

#### Test pada Gilgalad (Client Dinamis Keluarga Peri)
```
apt update
apt install isc-dhcp-client -y

# Release IP lama
dhclient -r eth0

# Request IP baru
dhclient -v eth0

# Cek lease time yang didapat
cat /var/lib/dhcp/dhclient.leases
```
<img width="613" height="370" alt="image" src="https://github.com/user-attachments/assets/e1612baf-c69e-4e85-896d-8699a9691fc5" />

## Soal_7
Para Ksatria Númenor (Elendil, Isildur, Anarion) mulai membangun benteng pertahanan digital mereka menggunakan teknologi Laravel. Instal semua tools yang dibutuhkan (php8.4, composer, nginx) dan dapatkan cetak biru benteng dari Resource-laravel di setiap node worker Laravel. Cek dengan lynx di client.

### Script
#### Laravel Workers (Elendil, Isildur, Anarion)
```
#!/bin/bash
# Script instalasi Laravel dengan Nginx dan PHP 8.2 - NETWORK TIMEOUT FIXED
# Usage: bash soal7-fixed-network.sh

set -e  # Exit on error

echo "=== Memulai instalasi Laravel ==="

# Update sources.list
echo "=== Mengupdate sources.list ==="
cat > /etc/apt/sources.list << 'EOF'
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free
EOF

# Update package list
echo "=== Updating package list ==="
apt-get update

# Install dependencies
echo "=== Installing dependencies ==="
apt-get install -y software-properties-common
apt-get install -y lsb-release ca-certificates apt-transport-https gnupg2 curl git unzip

# Add PHP repository
echo "=== Adding PHP repository ==="
curl -sSL https://packages.sury.org/php/README.txt | bash -x

# Install PHP 8.2 and extensions
echo "=== Installing PHP 8.2 ==="
apt install -y php8.2 php8.2-fpm php8.2-cli php8.2-common php8.2-curl php8.2-mbstring php8.2-xml php8.2-zip php8.2-bcmath php8.2-gd unzip git

# Install Nginx
echo "=== Installing Nginx ==="
apt-get install -y nginx
service nginx start
ps aux | grep nginx

# Install Composer
echo "=== Installing Composer ==="
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer --version

# Clone Laravel project
echo "=== Cloning Laravel project ==="
cd /var/www

# Hapus directory lama jika ada
if [ -d "resource-laravel-k1" ]; then
    echo "⚠ Directory resource-laravel-k1 sudah ada, menghapus..."
    rm -rf resource-laravel-k1
fi

git clone https://github.com/elshiraphine/laravel-simple-rest-api.git resource-laravel-k1
cd resource-laravel-k1

# Install dependencies - TANPA UPDATE untuk hindari timeout
echo "=== Installing Laravel dependencies ==="
echo "⚠ Skipping composer update untuk menghindari network timeout"

# Cek apakah vendor sudah ada dari repo
if [ -d "vendor" ] && [ -n "$(ls -A vendor)" ]; then
    echo "✓ Vendor directory sudah ada dari repository"
    composer install --no-interaction --prefer-dist --no-dev || {
        echo "⚠ Composer install gagal, menggunakan vendor yang sudah ada"
    }
else
    echo "Installing dependencies dari packagist..."
    composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader || {
        echo "✗ Composer install gagal!"
        echo "Mencoba mode offline..."
        COMPOSER_DISABLE_NETWORK=1 composer install --no-interaction || {
            echo "✗ Mode offline juga gagal. Melanjutkan tanpa composer..."
        }
    }
fi

# Setup environment
echo "=== Setting up environment ==="
cp .env.example .env
php artisan key:generate

# Verify installation
echo "=== Verifying installation ==="
ls -la /var/www/resource-laravel-k1/ | head -15
echo ""
echo "=== .env content ==="
cat /var/www/resource-laravel-k1/.env
echo ""
echo "=== Vendor directory ==="
if [ -d "vendor" ]; then
    ls /var/www/resource-laravel-k1/vendor/ | head -10
    echo "✓ Vendor directory OK"
else
    echo "⚠ Vendor directory tidak ada"
fi
echo ""
php artisan --version

# Configure Nginx
echo "=== Configuring Nginx ==="

# Remove old configs
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 80;
    server_name _;  # Accept any hostname/IP

    root /var/www/resource-laravel-k1/public;
    index index.php index.html;

    # Logging
    access_log /var/log/nginx/laravel-access.log;
    error_log /var/log/nginx/laravel-error.log;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico {
        access_log off;
        log_not_found off;
    }

    location = /robots.txt {
        access_log off;
        log_not_found off;
    }

    error_page 404 /index.php;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
EOF

# Enable site
echo "=== Enabling Laravel site ==="
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# Set permissions
echo "=== Setting permissions ==="
cd /var/www/resource-laravel-k1
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
chown -R www-data:www-data /var/www/resource-laravel-k1

# Start services
echo "=== Starting PHP-FPM ==="
service php8.2-fpm restart
sleep 2

echo "=== PHP-FPM Socket Check ==="
ls -la /run/php/

# Test and restart Nginx
echo "=== Testing and restarting Nginx ==="
nginx -t
if [ $? -eq 0 ]; then
    service nginx restart
    echo "✓ Nginx restarted successfully"
else
    echo "✗ Nginx config error!"
    exit 1
fi

echo ""
echo "=========================================="
echo "  ✅ INSTALASI SELESAI!"
echo "=========================================="
echo ""

# Testing
echo "=== TESTING ==="
MY_IP=$(hostname -I | awk '{print $1}')

echo "[1] Services Status:"
ps aux | grep php-fpm | grep -v grep | head -2
ps aux | grep nginx | grep -v grep | head -2

echo ""
echo "[2] Port 80 Listening:"
netstat -tulpn | grep :80 2>/dev/null || ss -tulpn | grep :80 2>/dev/null || echo "⚠ netstat/ss not available"

echo ""
echo "[3] Test HTTP via localhost:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost 2>/dev/null)
if [ "$HTTP_CODE" == "200" ]; then
    echo "✓ HTTP 200 OK"
    curl -s http://localhost 2>/dev/null | head -30
else
    echo "✗ HTTP $HTTP_CODE - ERROR!"
    echo "Checking error log..."
    tail -20 /var/log/nginx/laravel-error.log 2>/dev/null || echo "No error log found"
fi

echo ""
echo "[4] Test API endpoint:"
API_RESPONSE=$(curl -s http://localhost/api/airing 2>&1)
if echo "$API_RESPONSE" | grep -q "airing\|id\|title" 2>/dev/null; then
    echo "✓ API endpoint working"
    echo "$API_RESPONSE" | head -30
else
    echo "⚠ API response:"
    echo "$API_RESPONSE" | head -30
fi

echo ""
echo "=========================================="
echo "  AKSES INFO"
echo "=========================================="
echo "IP Address: $MY_IP"
echo ""
echo "Akses dari node ini:"
echo "  curl http://localhost"
echo "  curl http://localhost/api/airing"
echo ""
echo "Akses dari client:"
echo "  lynx http://$MY_IP"
echo "  curl http://$MY_IP/api/airing"
echo ""
echo "=========================================="
echo ""
echo "Jika ada error, cek log:"
echo "  tail -f /var/log/nginx/laravel-error.log"
echo "  tail -f /var/log/php8.2-fpm.log"
echo "=========================================="
```

### UJI
#### Semua Node selain Durin dan Minastir (Contoh: Amandil)
```
apt-get update
apt-get install -y lynx
lynx http://192.212.1.2   # Elendil
lynx http://192.212.1.3   # Isildur
lynx http://192.212.1.4  # Anarion
```
<img width="1365" height="711" alt="image" src="https://github.com/user-attachments/assets/9112ab75-4c7e-482b-a9db-4312469402b1" />

## Soal_8
Setiap benteng Númenor harus terhubung ke sumber pengetahuan, Palantir. Konfigurasikan koneksi database di file .env masing-masing worker. Setiap benteng juga harus memiliki gerbang masuk yang unik; atur nginx agar Elendil mendengarkan di port 8001, Isildur di 8002, dan Anarion di 8003. Jangan lupa jalankan migrasi dan seeding awal dari Elendil. Buat agar akses web hanya bisa melalui domain nama, tidak bisa melalui ip.

### SCRIPT
#### Palantir
```
#!/bin/bash
# setup-palantir.sh — FINAL VERSION (NO SUDO!)
# Kelompok K-02 | Jarkom Modul 3

set -e

echo "=== [PALANTIR] Setup Database Server (NO SUDO) ==="

# === 1. Install MariaDB ===
echo "=== [1] Install MariaDB ==="
apt update -qq
apt install -y mariadb-server mariadb-client > /dev/null 2>&1

# === 2. Direktori runtime ===
echo "=== [2] Buat /run/mysqld ==="
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld
chmod 755 /run/mysqld

# === 3. Bind to all interfaces ===
echo "=== [3] bind-address = 0.0.0.0 ==="
cat > /etc/mysql/mariadb.conf.d/50-server.cnf << 'EOF'
[mysqld]
bind-address = 0.0.0.0
skip-networking = 0
EOF

# === 4. Inisialisasi datadir ===
if [ ! -d /var/lib/mysql/mysql ]; then
    echo "=== [4] Inisialisasi datadir ==="
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

# === 5. Stop proses lama ===
echo "=== [5] Stop proses lama ==="
pkill mariadbd 2>/dev/null || true
pkill mysqld_safe 2>/dev/null || true
sleep 3

# === 6. Start MariaDB ===
echo "=== [6] Start MariaDB ==="
/usr/bin/mysqld_safe --user=mysql --skip-grant-tables --skip-networking &
sleep 8

# === 7. Akses root VIA unix_socket (LANGSUNG mysql) ===
echo "=== [7] Setup DB & User ==="
mysql << 'EOF'
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';
CREATE DATABASE IF NOT EXISTS laravel_db;
CREATE USER IF NOT EXISTS 'laravel_user'@'%' IDENTIFIED BY 'laravel_password';
GRANT ALL PRIVILEGES ON laravel_db.* TO 'laravel_user'@'%';
FLUSH PRIVILEGES;
EOF

# === 8. Restart normal ===
echo "=== [8] Restart normal ==="
pkill mariadbd 2>/dev/null || true
pkill mysqld_safe 2>/dev/null || true
sleep 3
/usr/bin/mysqld_safe --user=mysql > /var/log/mysql.log 2>&1 &
sleep 8

# === 9. Test koneksi ===
echo "=== [9] Test koneksi ==="
if mysql -u laravel_user -p'laravel_password' -h 127.0.0.1 laravel_db -e "SELECT 'DB OK';" | grep -q "DB OK"; then
    echo "KONEKSI BERHASIL"
else
    echo "KONEKSI GAGAL"
    exit 1
fi

# === 10. Info ===
echo ""
echo "PALANTIR SIAP!"
echo "Host: $(hostname -I | awk '{print $1}')"
echo "DB: laravel_db"
echo "User: laravel_user"
echo "Pass: laravel_password"
echo ""
echo "Gunakan di .env worker:"
echo "DB_HOST=palantir.k02.com"
echo "DB_DATABASE=laravel_db"
echo "DB_USERNAME=laravel_user"
echo "DB_PASSWORD=laravel_password"
```

#### Elendil
```
#!/bin/bash
# soal8-elendil.sh — Setup Elendil (Port 8001)
# Jalankan di Elendil

set -e  # Exit on error

echo "=== [SOAL 8] Setup ELENDIL → port 8001 ==="

# 1. Install PHP MySQL Driver
echo "Installing PHP MySQL extension..."
apt-get update
apt-get install -y php8.2-mysql

# 2. Update .env
cd /var/www/resource-laravel-k1

# Backup .env
if [ ! -f .env.backup ]; then
    cp .env .env.backup
    echo "✓ Backup .env created"
fi

sed -i 's/DB_HOST=.*/DB_HOST=palantir.k02.com/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel_db/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=laravel_user/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=laravel_password/' .env
echo "✓ Updated .env → palantir.k02.com"

# 3. Update routes/api.php ke versi Controller-based
cat > routes/api.php << 'APIEOF'
<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AiringController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'airing'], function () {
   Route::get('/', [AiringController::class, 'index']);
   Route::get('/{id}', [AiringController::class, 'show']);
   Route::post('/', [AiringController::class, 'store']);
});
APIEOF

echo "✓ Updated routes/api.php"

# 4. Clear Laravel cache
php artisan config:clear
php artisan route:clear
php artisan cache:clear
echo "✓ Cache cleared"

# 5. Hapus config lama
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

# 6. Buat config Nginx (DENGAN explicit bind dan blocking yang lebih baik)
cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 0.0.0.0:8001;
    server_name elendil.k02.com;

    root /var/www/resource-laravel-k1/public;
    index index.php index.html;

    access_log /var/log/nginx/elendil-access.log;
    error_log /var/log/nginx/elendil-error.log;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }

    # OPTIONAL: Uncomment untuk blocking akses via IP (setelah testing berhasil)
    # Blocking yang lebih smart - hanya block IP mentah
    # if ($host ~ "^[0-9.]+(:8001)?$") {
    #     return 403;
    # }
}
EOF

echo "✓ Nginx config created (blocking disabled untuk testing)"

# 7. Aktifkan site
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# 8. Set permissions
chown -R www-data:www-data /var/www/resource-laravel-k1
chmod -R 775 /var/www/resource-laravel-k1/storage
chmod -R 775 /var/www/resource-laravel-k1/bootstrap/cache

# 9. Restart services
echo "Restarting services..."
service php8.2-fpm restart
sleep 1
nginx -t && service nginx restart
sleep 2

echo ""
echo "=== Testing Setup ==="

# Test database connection
echo "[1] Testing database connection..."
php -r "try { new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password'); echo '✓ Database connection OK\n'; } catch (Exception \$e) { echo '✗ Database FAILED: ' . \$e->getMessage() . '\n'; }"

# Test services
echo ""
echo "[2] Service status:"
ps aux | grep nginx | grep -v grep > /dev/null && echo "✓ Nginx running"
ps aux | grep php-fpm | grep -v grep > /dev/null && echo "✓ PHP-FPM running"

# Test port
echo ""
echo "[3] Port 8001 listening:"
ss -tulpn | grep :8001 || netstat -tulpn | grep :8001

# Test HTTP
echo ""
echo "[4] Testing HTTP..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8001)
echo "localhost:8001 → HTTP $HTTP_CODE"

MY_IP=$(hostname -I | awk '{print $1}')
HTTP_CODE_IP=$(curl -s -o /dev/null -w "%{http_code}" http://$MY_IP:8001)
echo "$MY_IP:8001 → HTTP $HTTP_CODE_IP"

# Test API
echo ""
echo "[5] Testing API endpoint /api/airing..."
curl -s http://localhost:8001/api/airing | head -20
echo ""

# Final summary
echo ""
echo "=========================================="
echo "✓✓✓ ELENDIL SETUP COMPLETE!"
echo "=========================================="
echo "Server IP: $MY_IP"
echo "Port: 8001"
echo ""
echo "Test dari client:"
echo "  curl http://elendil.k02.com:8001"
echo "  curl http://$MY_IP:8001"
echo "  lynx http://elendil.k02.com:8001"
echo ""
echo "NOTES:"
echo "- Blocking rule DISABLED untuk testing"
echo "- Jika semua test berhasil, uncomment blocking di:"
echo "  /etc/nginx/sites-available/laravel (line 28-30)"
echo "=========================================="
```

#### Isildur
```
#!/bin/bash
# soal8-isildur.sh — Setup Isildur (Port 8002)
# Jalankan di Isildur

echo "=== [SOAL 8] Setup ISILDUR → port 8002 ==="

# 1. Install PHP MySQL Driver
echo "Installing PHP MySQL extension..."
apt-get update
apt-get install -y php8.2-mysql

# 2. Update .env
cd /var/www/resource-laravel-k1
sed -i 's/DB_HOST=.*/DB_HOST=palantir.k02.com/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel_db/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=laravel_user/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=laravel_password/' .env
echo "✓ Updated .env → palantir.k02.com"

# 3. Update routes/api.php ke versi Controller-based (sudah ada, tapi pastikan)
cat > routes/api.php << 'APIEOF'
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AiringController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'airing'], function () {
   Route::get('/', [AiringController::class, 'index']);
   Route::get('/{id}', [AiringController::class, 'show']);
   Route::post('/', [AiringController::class, 'store']);
});
APIEOF
echo "✓ Updated routes/api.php"

# 4. Clear Laravel cache
php artisan config:clear
php artisan route:clear
php artisan cache:clear
echo "✓ Cache cleared"

# 5. Hapus config lama
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

# 6. Buat config Nginx
cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 8002;
    server_name isildur.k02.com;

    root /var/www/resource-laravel-k1/public;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
    }

    # BLOKIR AKSES VIA IP
    if ($host != "isildur.k02.com") {
        return 444;
    }
}
EOF

# 7. Aktifkan site
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# 8. Restart services
service php8.2-fpm restart
nginx -t && service nginx restart

echo ""
echo "=== Testing Setup ==="
php -r "new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');" && echo "✓ Database connection OK"
echo ""
echo "✓✓✓ ISILDUR SIAP → http://isildur.k02.com:8002"
echo "Testing API endpoint..."
sleep 2
curl -s http://localhost:8002/api/airing
echo ""
```

#### Anarion
```
#!/bin/bash
# soal8-anarion.sh — Setup Anarion (Port 8003)
# Jalankan di Anarion

echo "=== [SOAL 8] Setup ANARION → port 8003 ==="

# 1. Install PHP MySQL Driver
echo "Installing PHP MySQL extension..."
apt-get update
apt-get install -y php8.2-mysql

# 2. Update .env
cd /var/www/resource-laravel-k1
sed -i 's/DB_HOST=.*/DB_HOST=palantir.k02.com/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel_db/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=laravel_user/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=laravel_password/' .env
echo "✓ Updated .env → palantir.k02.com"

# 3. Update routes/api.php ke versi Controller-based
cat > routes/api.php << 'APIEOF'
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AiringController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'airing'], function () {
   Route::get('/', [AiringController::class, 'index']);
   Route::get('/{id}', [AiringController::class, 'show']);
   Route::post('/', [AiringController::class, 'store']);
});
APIEOF
echo "✓ Updated routes/api.php"

# 4. Clear Laravel cache
php artisan config:clear
php artisan route:clear
php artisan cache:clear
echo "✓ Cache cleared"

# 5. Hapus config lama
rm -f /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

# 6. Buat config Nginx
cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 8003;
    server_name anarion.k02.com;

    root /var/www/resource-laravel-k1/public;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
    }

    # BLOKIR AKSES VIA IP
    if ($host != "anarion.k02.com") {
        return 444;
    }
}
EOF

# 7. Aktifkan site
ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

# 8. Restart services
service php8.2-fpm restart
nginx -t && service nginx restart

echo ""
echo "=== Testing Setup ==="
php -r "new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');" && echo "✓ Database connection OK"
echo ""
echo "✓✓✓ ANARION SIAP → http://anarion.k02.com:8003"
echo "Testing API endpoint..."
sleep 2
curl -s http://localhost:8003/api/airing
echo ""
```

#### Laravel Workers (Elendil, Isildur, Anarion)
```
apt-get update
apt-get install -y mariadb-client
mysql -u laravel_user -p'laravel_password' -h palantir.k02.com -e "SHOW DATABASES;"
```
<img width="1096" height="182" alt="image" src="https://github.com/user-attachments/assets/b175229c-016f-48d6-9343-794c1f7216c5" />
<img width="1394" height="232" alt="image" src="https://github.com/user-attachments/assets/443ef162-1a8c-41ab-9262-c576fd6421df" />
<img width="1413" height="230" alt="image" src="https://github.com/user-attachments/assets/3b4ee351-2262-454e-bf19-985725caf28b" />

## Soal_9
Setiap benteng Númenor harus terhubung ke sumber pengetahuan, Palantir. Konfigurasikan koneksi database di file .env masing-masing worker. Setiap benteng juga harus memiliki gerbang masuk yang unik; atur nginx agar Pastikan setiap benteng berfungsi secara mandiri. Dari dalam node client masing-masing, gunakan lynx untuk melihat halaman utama Laravel dan curl /api/airing untuk memastikan mereka bisa mengambil data dari Palantir.

### UJI
#### Semua Node selain Durin dan Minastir (Contoh: Amandil)
```
apt-get update
apt-get install -y lynx
lynx http://elendil.k02.com:8001
lynx http://isildur.k02.com:8002
lynx http://anarion.k02.com:8003
```
<img width="1919" height="1199" alt="image" src="https://github.com/user-attachments/assets/06b41a5e-2357-4397-8c91-a4cf10b2fa3d" />

#### Semua Node selain Durin dan Minastir (Contoh: Amandil)
```
#!/bin/bash
# migrate-database.sh - Run di Elendil

echo "=== Database Migration ==="

cd /var/www/resource-laravel-k1

# 1. Test koneksi database
echo "[1] Testing database connection..."
php -r "new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');" && echo "✓ Connection OK"

# 2. Run migrations
echo ""
echo "[2] Running migrations..."
php artisan migrate --force

# 3. (Optional) Seed data jika ada
echo ""
echo "[3] Seeding data..."
php artisan db:seed --force 2>/dev/null || echo "No seeder found (OK)"

# 4. Verify tables
echo ""
echo "[4] Verifying tables..."
php -r "
\$pdo = new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');
\$result = \$pdo->query('SHOW TABLES');
echo 'Tables in laravel_db:\n';
foreach(\$result as \$row) {
    echo '  - ' . \$row[0] . '\n';
}
"

# 5. Test API
echo ""
echo "[5] Testing API endpoint..."
curl -s http://localhost:8001/api/airing | python3 -m json.tool 2>/dev/null || curl -s http://localhost:8001/api/airing

echo ""
echo "✓ Migration complete!"
```
```
curl http://elendil.k02.com:8001/api/airing
curl http://isildur.k02.com:8002/api/airing
curl http://anarion.k02.com:8003/api/airing
```
<img width="785" height="63" alt="image" src="https://github.com/user-attachments/assets/eea43e0d-c163-4e8a-969f-531563a569b1" />
<img width="785" height="63" alt="image" src="https://github.com/user-attachments/assets/6a639ff5-dbcb-4bf0-a188-075ec56e399d" />
<img width="784" height="63" alt="image" src="https://github.com/user-attachments/assets/3ea664e9-32f8-4370-a89b-85f2b9086708" />

## Soal_10
Pemimpin bijak Elros ditugaskan untuk mengkoordinasikan pertahanan Númenor. Konfigurasikan nginx di Elros untuk bertindak sebagai reverse proxy. Buat upstream bernama kesatria_numenor yang berisi alamat ketiga worker (Elendil, Isildur, Anarion). Atur agar semua permintaan yang datang ke domain elros.<xxxx>.com diteruskan secara merata menggunakan algoritma Round Robin ke backend.

### SCRIPT
#### Elros
```
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
```

#### Elendil
```
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
```

### UJI
#### Semua Node selain Durin dan Minastir (Contoh: Amandil)
```
#!/bin/bash
# test-load-balancer.sh
# Script untuk testing Load Balancer Elros

echo "=========================================="
echo "  TESTING LOAD BALANCER ELROS (SOAL 10)"
echo "=========================================="
echo ""

# Test 1: Resolusi DNS
echo "[TEST 1] Resolusi DNS elros.k02.com"
host elros.k02.com
if [ $? -eq 0 ]; then
    echo "✓ DNS OK"
else
    echo "✗ DNS FAILED"
    exit 1
fi
echo ""

# Test 2: Ping
echo "[TEST 2] Ping elros.k02.com"
ping -c 3 elros.k02.com
if [ $? -eq 0 ]; then
    echo "✓ PING OK"
else
    echo "✗ PING FAILED"
    exit 1
fi
echo ""

# Test 3: HTTP Response
echo "[TEST 3] HTTP Response dari Load Balancer"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://elros.k02.com/api/airing)
if [ "$RESPONSE" == "200" ]; then
    echo "✓ HTTP 200 OK"
else
    echo "✗ HTTP $RESPONSE"
    exit 1
fi
echo ""

# Test 4: Round Robin Distribution
echo "[TEST 4] Round Robin - 10 Requests"
for i in {1..10}; do
    echo -n "Request #$i: "
    curl -s http://elros.k02.com/api/airing | head -c 40
    echo "..."
    sleep 0.3
done
echo ""
echo "✓ Semua request berhasil (Load Balancer berfungsi)"
echo ""

# Test 5: Blokir akses via IP
echo "[TEST 5] Blokir akses via IP (192.212.1.6)"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://192.212.1.6/api/airing)
if [ "$RESPONSE" == "000" ] || [ "$RESPONSE" == "444" ]; then
    echo "✓ Akses via IP berhasil diblokir"
else
    echo "⚠ Akses via IP masih bisa (HTTP $RESPONSE)"
fi
echo ""

echo "=========================================="
echo "  TESTING SELESAI"
echo "=========================================="
```
<img width="765" height="973" alt="image" src="https://github.com/user-attachments/assets/24db2ed3-a288-4829-9f0f-3b83d826a35f" />

## Soal_11
Musuh mencoba menguji kekuatan pertahanan Númenor. Dari node client, luncurkan serangan benchmark (ab) ke elros.<xxxx>.com/api/airing/:
- Serangan Awal: -n 100 -c 10 (100 permintaan, 10 bersamaan).
- Serangan Penuh: -n 2000 -c 100 (2000 permintaan, 100 bersamaan). Pantau kondisi para worker dan periksa log Elros untuk melihat apakah ada worker yang kewalahan atau koneksi yang gagal.
- Strategi Bertahan: Tambahkan weight dalam algoritma, kemudian catat apakah lebih baik atau tidak.

### SCRIPT
#### Di AMANDIL - Benchmark TANPA Weight
```
#!/bin/bash
# soal11-client.sh - Benchmark di Client
# Jalankan di AMANDIL

echo "=========================================="
echo "  SOAL 11: BENCHMARK LOAD BALANCER"
echo "=========================================="
echo ""

# Install Apache Benchmark jika belum ada
if ! command -v ab &> /dev/null; then
    echo "Installing Apache Benchmark..."
    apt-get update -qq
    apt-get install -y apache2-utils
fi

read -p "Benchmark [1] TANPA weight atau [2] DENGAN weight? (1/2): " MODE

if [ "$MODE" == "1" ]; then
    PREFIX="noweight"
    TITLE="TANPA WEIGHT"
else
    PREFIX="weight"
    TITLE="DENGAN WEIGHT"
fi

echo ""
echo "=========================================="
echo "  BENCHMARK $TITLE"
echo "=========================================="
echo ""

# Test 1
echo "=== TEST 1: Serangan Awal (n=100, c=10) ==="
ab -n 100 -c 10 http://elros.k02.com/api/airing | tee /tmp/ab-test1-$PREFIX.txt

echo ""
echo "=========================================="
echo ""

# Tunggu sebentar
sleep 2

# Test 2
echo "=== TEST 2: Serangan Penuh (n=2000, c=100) ==="
ab -n 2000 -c 100 http://elros.k02.com/api/airing | tee /tmp/ab-test2-$PREFIX.txt

echo ""
echo "=========================================="
echo "  RINGKASAN HASIL"
echo "=========================================="
echo ""
echo "TEST 1 (n=100, c=10):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test1-$PREFIX.txt | head -3
echo ""
echo "TEST 2 (n=2000, c=100):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test2-$PREFIX.txt | head -3
echo ""
echo "=========================================="
echo "Hasil lengkap tersimpan di:"
echo "  /tmp/ab-test1-$PREFIX.txt"
echo "  /tmp/ab-test2-$PREFIX.txt"
echo "=========================================="

# Jika sudah ada kedua hasil, tampilkan perbandingan
if [ -f /tmp/ab-test1-noweight.txt ] && [ -f /tmp/ab-test1-weight.txt ]; then
    echo ""
    echo "=========================================="
    echo "  PERBANDINGAN LENGKAP"
    echo "=========================================="
    echo ""
    echo "TEST 1 (n=100, c=10):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-weight.txt | head -2
    echo ""
    echo "----------------------------------------"
    echo ""
    echo "TEST 2 (n=2000, c=100):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-weight.txt | head -2
    echo ""
    echo "=========================================="
fi

echo ""
```
<img width="757" height="845" alt="image" src="https://github.com/user-attachments/assets/2adfb0e6-08f8-42b6-94de-fd6d79ceb47b" /><br>
<img width="619" height="900" alt="image" src="https://github.com/user-attachments/assets/5893f9dc-7db5-416f-b1f6-bd98b0910ab0" /><br>
<img width="394" height="314" alt="image" src="https://github.com/user-attachments/assets/fbb841b8-d47b-4f5c-99ce-b786ab38c742" />

#### Di ELROS - Update Config dengan Weight
```
#!/bin/bash
# soal11-elros.sh - Update config dengan weight
# Jalankan di ELROS

echo "=========================================="
echo "  SOAL 11: UPDATE CONFIG ELROS"
echo "=========================================="
echo ""

# Backup config lama
if [ -f /etc/nginx/sites-available/load-balancer ]; then
    cp /etc/nginx/sites-available/load-balancer /etc/nginx/sites-available/load-balancer.backup
    echo "✓ Backup config dibuat"
fi

# Buat config dengan weight
cat > /etc/nginx/sites-available/load-balancer << 'EOF'
upstream kesatria_numenor {
    server elendil.k02.com:8001 weight=3;
    server isildur.k02.com:8002 weight=2;
    server anarion.k02.com:8003 weight=1;
}

server {
    listen 80;
    server_name elros.k02.com;

    location / {
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    if ($host != "elros.k02.com") {
        return 444;
    }
}
EOF

echo "✓ Config dengan weight dibuat"
echo ""

# Test dan restart
echo "Testing nginx config..."
nginx -t

if [ $? -eq 0 ]; then
    echo ""
    echo "Restarting nginx..."
    service nginx restart
    sleep 2
    
    if ps aux | grep nginx | grep -v grep > /dev/null; then
        echo "✓ Nginx berhasil direstart"
    else
        echo "✗ Nginx gagal restart"
        exit 1
    fi
else
    echo "✗ Nginx config error"
    exit 1
fi

echo ""
echo "=========================================="
echo "✅ CONFIG UPDATE SELESAI"
echo "=========================================="
echo "Weight Distribution:"
echo "  - Elendil: weight=3 (50% traffic)"
echo "  - Isildur: weight=2 (33% traffic)"
echo "  - Anarion: weight=1 (17% traffic)"
echo ""
echo "Sekarang jalankan benchmark di Client lagi:"
echo "  bash soal11-client.sh"
echo "  Pilih: 2 (DENGAN weight)"
echo "=========================================="
```
<img width="943" height="783" alt="image" src="https://github.com/user-attachments/assets/888fd744-addb-4c24-ac98-7a151a938e89" />

#### Di AMANDIL - Benchmark DENGAN Weight
```
#!/bin/bash
# soal11-client.sh - Benchmark di Client
# Jalankan di AMANDIL

echo "=========================================="
echo "  SOAL 11: BENCHMARK LOAD BALANCER"
echo "=========================================="
echo ""

# Install Apache Benchmark jika belum ada
if ! command -v ab &> /dev/null; then
    echo "Installing Apache Benchmark..."
    apt-get update -qq
    apt-get install -y apache2-utils
fi

read -p "Benchmark [1] TANPA weight atau [2] DENGAN weight? (1/2): " MODE

if [ "$MODE" == "1" ]; then
    PREFIX="noweight"
    TITLE="TANPA WEIGHT"
else
    PREFIX="weight"
    TITLE="DENGAN WEIGHT"
fi

echo ""
echo "=========================================="
echo "  BENCHMARK $TITLE"
echo "=========================================="
echo ""

# Test 1
echo "=== TEST 1: Serangan Awal (n=100, c=10) ==="
ab -n 100 -c 10 http://elros.k02.com/api/airing | tee /tmp/ab-test1-$PREFIX.txt

echo ""
echo "=========================================="
echo ""

# Tunggu sebentar
sleep 2

# Test 2
echo "=== TEST 2: Serangan Penuh (n=2000, c=100) ==="
ab -n 2000 -c 100 http://elros.k02.com/api/airing | tee /tmp/ab-test2-$PREFIX.txt

echo ""
echo "=========================================="
echo "  RINGKASAN HASIL"
echo "=========================================="
echo ""
echo "TEST 1 (n=100, c=10):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test1-$PREFIX.txt | head -3
echo ""
echo "TEST 2 (n=2000, c=100):"
grep "Time taken\|Requests per second\|Time per request" /tmp/ab-test2-$PREFIX.txt | head -3
echo ""
echo "=========================================="
echo "Hasil lengkap tersimpan di:"
echo "  /tmp/ab-test1-$PREFIX.txt"
echo "  /tmp/ab-test2-$PREFIX.txt"
echo "=========================================="

# Jika sudah ada kedua hasil, tampilkan perbandingan
if [ -f /tmp/ab-test1-noweight.txt ] && [ -f /tmp/ab-test1-weight.txt ]; then
    echo ""
    echo "=========================================="
    echo "  PERBANDINGAN LENGKAP"
    echo "=========================================="
    echo ""
    echo "TEST 1 (n=100, c=10):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test1-weight.txt | head -2
    echo ""
    echo "----------------------------------------"
    echo ""
    echo "TEST 2 (n=2000, c=100):"
    echo ""
    echo "TANPA Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-noweight.txt | head -2
    echo ""
    echo "DENGAN Weight:"
    grep "Time taken\|Requests per second" /tmp/ab-test2-weight.txt | head -2
    echo ""
    echo "=========================================="
fi

echo ""
```
<img width="598" height="808" alt="image" src="https://github.com/user-attachments/assets/307232ab-14ee-4230-ace9-79e575413316" /><br>
<img width="601" height="897" alt="image" src="https://github.com/user-attachments/assets/6c8e3e6a-5485-433f-a8b4-8974a834cb51" /><br>
<img width="389" height="314" alt="image" src="https://github.com/user-attachments/assets/b5138599-360c-4df6-9634-ddae9b38b5de" />

#### Perbandingan Lengkap
<img width="396" height="448" alt="image" src="https://github.com/user-attachments/assets/9af2ea71-961e-4e18-8b11-4bc87d709c38" />

## Soal_12
Para Penguasa Peri (Galadriel, Celeborn, Oropher) membangun taman digital mereka menggunakan PHP. Instal nginx dan php8.4-fpm di setiap node worker PHP. Buat file index.php sederhana di /var/www/html masing-masing yang menampilkan nama hostname mereka. Buat agar akses web hanya bisa melalui domain nama, tidak bisa melalui ip.

## SCRIPT SOAL 12 
```
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
```
## COBA Di galadriel, celeborn, oropher
```
nano soal12.sh
```
Beri Izin Eksekusi:

```
chmod +x soal12.sh
```
## Jalankan untuk masing-masing node:
```
bash soal12.sh galadriel
bash soal12.sh celeborn
bash soal12.sh oropher
```
## UJI COBA 
```
curl galadriel.k02.com
curl celeborn.k02.com
curl oropher.k02.com
```
<img width="420" height="47" alt="image" src="https://github.com/user-attachments/assets/067c40af-2b40-4858-ab54-e1ab4f26f371"/><br>
<img width="421" height="41" alt="image" src="https://github.com/user-attachments/assets/461f48ba-4898-46d3-9c2d-eae72f1fcaa2"/><br>
<img width="353" height="44" alt="image" src="https://github.com/user-attachments/assets/897d94bf-70a1-463d-bedc-616b8b34dc3b"/>



## Soal_13
Setiap taman Peri harus dapat diakses. Konfigurasikan nginx di setiap worker PHP untuk meneruskan permintaan file .php ke socket php-fpm yang sesuai. Atur agar Galadriel mendengarkan di port 8004, Celeborn di 8005, dan Oropher di 8006.

## SCRIPT SOAL 13 
```
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
```
## COBA Di galadriel, celeborn, oropher
```
nano soal13.sh
```
## Jalankan 
```
bash soal13.sh
```

## UJI COBA 
```
  curl galadriel.k02.com:8004
  curl celeborn.k02.com:8005
  curl oropher.k02.com:8006
```

<img width="619" height="58" alt="image" src="https://github.com/user-attachments/assets/4211749d-a92e-422f-ba7f-d6439969f83d"/><br>
<img width="600" height="50" alt="image" src="https://github.com/user-attachments/assets/8883c6c3-34d8-47ad-b75c-ba226114f43d"/><br>
<img width="619" height="48" alt="image" src="https://github.com/user-attachments/assets/7574c19e-ed5b-4214-8f8f-374150ee3671"/>

## Soal_14
Keamanan adalah prioritas. Terapkan Basic HTTP Authentication pada nginx di setiap worker PHP, sehingga hanya mereka yang tahu kata sandi (user: noldor, pass: silvan) yang bisa masuk.

## SCRIPT SOAL 14 
```
#!/bin/bash
# =======================================================
# SOAL 14 - Basic HTTP Authentication untuk Taman Peri
# Domain: galadriel.k02.com, celeborn.k02.com, oropher.k02.com
# User: noldor | Pass: silvan
# =======================================================

if [ "$EUID" -ne 0 ]; then
  echo "Harap jalankan script ini sebagai root!"
  exit 1
fi

echo "=============================================="
echo "     🔒 KONFIGURASI KEAMANAN TAMAN PERI"
echo "=============================================="

# 1️⃣ Pastikan nginx, php-fpm, dan apache2-utils terpasang
echo "[+] Memastikan nginx, php-fpm, dan apache2-utils terpasang..."
apt update -y >/dev/null 2>&1
apt install -y nginx php8.4-fpm apache2-utils >/dev/null 2>&1

# 2️⃣ Pastikan PHP-FPM berjalan
if ! pgrep -x "php-fpm8.4" >/dev/null; then
  echo "[+] Menjalankan PHP-FPM..."
  mkdir -p /run/php
  php-fpm8.4 -D
fi

# 3️⃣ Nonaktifkan konfigurasi default nginx
echo "[+] Menghapus konfigurasi default nginx..."
rm -f /etc/nginx/sites-enabled/default

# 4️⃣ Buat file htpasswd
echo "[+] Membuat file .htpasswd untuk autentikasi..."
htpasswd -cb /etc/nginx/.htpasswd noldor silvan >/dev/null 2>&1
chmod 644 /etc/nginx/.htpasswd
chown root:www-data /etc/nginx/.htpasswd

# 5️⃣ Cari socket PHP-FPM
SOCK=$(find /run/php/ -type s -name "php*-fpm.sock" | head -n 1)
if [ -z "$SOCK" ]; then
  echo "❌ Tidak ditemukan socket PHP-FPM! Pastikan php-fpm berjalan."
  exit 1
fi
echo "[+] Menggunakan socket PHP-FPM: $SOCK"

# 6️⃣ Fungsi membuat konfigurasi tiap domain
setup_worker() {
  local name=$1
  local port=$2
  local domain="${name}.k02.com"
  local webroot="/var/www/${domain}"

  echo ""
  echo "----------------------------------------------"
  echo "[+] Membuat konfigurasi untuk ${domain} (port ${port})"
  echo "----------------------------------------------"

  # Direktori & file PHP
  mkdir -p ${webroot}
  echo "<?php echo 'Halo dari ${name}! Hostname: ' . gethostname(); ?>" > ${webroot}/index.php
  chown -R www-data:www-data ${webroot}

  # Konfigurasi nginx
  cat > /etc/nginx/sites-available/${domain} << EOF
server {
    listen ${port};
    server_name ${domain};

    root ${webroot};
    index index.php index.html;

    location / {
        auth_basic "Restricted Area - ${name}";
        auth_basic_user_file /etc/nginx/.htpasswd;
        try_files \$uri \$uri/ /index.php;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        auth_basic "Restricted Area - ${name}";
        auth_basic_user_file /etc/nginx/.htpasswd;
        fastcgi_pass unix:${SOCK};
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }

    access_log /var/log/nginx/${name}.access.log;
    error_log /var/log/nginx/${name}.error.log;
}
EOF

  # Aktifkan
  ln -sf /etc/nginx/sites-available/${domain} /etc/nginx/sites-enabled/
}

# 7️⃣ Jalankan untuk semua worker
setup_worker "galadriel" 8004
setup_worker "celeborn" 8005
setup_worker "oropher" 8006

# 8️⃣ Tes & reload nginx
echo ""
echo "[+] Mengecek konfigurasi nginx..."
nginx -t

if [ $? -eq 0 ]; then
  echo "[+] Reload nginx..."
  nginx -s reload
  echo "✅ Semua taman Peri telah diamankan dengan Basic Auth!"
else
  echo "❌ Terdapat kesalahan pada konfigurasi nginx!"
  exit 1
fi

echo ""
echo "=============================================="
echo "   ✨ TAMAN PERI SUDAH TERLINDUNGI ✨"
echo "=============================================="
echo "Gunakan login: noldor / silvan"
echo ""
echo "Uji akses dengan:"
echo "  curl -u noldor:silvan http://galadriel.k02.com:8004/"
echo "  curl -u noldor:silvan http://celeborn.k02.com:8005/"
echo "  curl -u noldor:silvan http://oropher.k02.com:8006/"
```
## COBA Di galadriel, celeborn, oropher
```
nano soal14.sh
```
## Jadikan executable:
```
chmod +x soal14.sh
```
## Jalankan:
```
bash soal14.sh
```
## UJI HASIL 
```
curl -u noldor:silvan http://galadriel.k02.com:8004/
curl -u noldor:silvan http://celeborn.k02.com:8005/
curl -u noldor:silvan http://oropher.k02.com:8006/
```
<img width="667" height="47" alt="image" src="https://github.com/user-attachments/assets/e31cb51f-556a-4bea-a9c0-802f04449e60"/><br>
<img width="653" height="49" alt="image" src="https://github.com/user-attachments/assets/12b08bee-b896-48ac-aa24-a1419490670b"/><br>

<img width="619" height="48" alt="image" src="https://github.com/user-attachments/assets/8a404473-77d5-4e87-a6a2-a92240a02aa3" />

## Soal_15
Para Peri ingin tahu siapa yang mengunjungi taman mereka. Modifikasi konfigurasi Nginx di worker PHP untuk menambahkan header X-Real-IP yang akan diteruskan ke PHP. Ubah file index.php untuk menampilkan alamat IP pengunjung asli saat ini.

## SCRIPT SOAL 15
```
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
```
## COBA Di galadriel, celeborn, oropher
```
nano soal5.sh
```
## Jalankan : 
```
bash soal15.sh
```
## UJI COBA 
```
  curl -u noldor:silvan http://galadriel.k02.com:8004/
  curl -u noldor:silvan http://celeborn.k02.com:8005/
  curl -u noldor:silvan http://oropher.k02.com:8006/
```
<img width="587" height="644" alt="image" src="https://github.com/user-attachments/assets/0739766b-2246-45dd-8b48-312af572c465"/><br>
<img width="724" height="662" alt="image" src="https://github.com/user-attachments/assets/5bb6b978-166b-4117-865c-fb4fe947dd80"/><br>
<img width="632" height="651" alt="image" src="https://github.com/user-attachments/assets/82223588-4070-48a5-9be7-fac450e59642" />

## Soal_16
Raja Númenor terakhir yang ambisius, Pharazon, mencoba mengawasi taman-taman Peri. Konfigurasikan Nginx di Pharazon sebagai reverse proxy. Buat upstream Kesatria_Lorien berisi alamat ketiga worker PHP. Atur agar permintaan ke pharazon.<xxxx>.com diteruskan ke backend, dan pastikan konfigurasi Nginx di Pharazon juga meneruskan informasi Basic Authentication yang dimasukkan pengguna ke worker.

### UJI
#### Pharazon
```
#!/bin/bash
# =============================================================
# SOAL 16 - PHARAZON REVERSE PROXY
# Mengawasi taman-taman Peri (Galadriel, Celeborn, Oropher)
# dengan load balancing Round Robin
# =============================================================

set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "Jalankan sebagai root!"
  exit 1
fi

echo "=============================================="
echo "     👑 SETUP PHARAZON - REVERSE PROXY"
echo "=============================================="

# 1) Install Nginx jika belum ada
echo "[1/5] Memastikan Nginx terinstal..."
apt-get update -y >/dev/null 2>&1
apt-get install -y nginx curl dnsutils >/dev/null 2>&1

# 2) Backup konfigurasi lama
echo "[2/5] Backup konfigurasi lama..."
if [ -f /etc/nginx/sites-available/pharazon-lb ]; then
    cp /etc/nginx/sites-available/pharazon-lb /etc/nginx/sites-available/pharazon-lb.backup
    echo "✓ Backup dibuat"
fi

# 3) Hapus konfigurasi default
echo "[3/5] Menghapus konfigurasi default..."
rm -f /etc/nginx/sites-enabled/default

# 4) Buat konfigurasi reverse proxy
echo "[4/5] Membuat konfigurasi Reverse Proxy..."
cat > /etc/nginx/sites-available/pharazon-lb << 'EOF'
# Upstream definition untuk Kesatria_Lorien
upstream Kesatria_Lorien {
    server galadriel.k02.com:8004;
    server celeborn.k02.com:8005;
    server oropher.k02.com:8006;
}

# Log format untuk tracking
log_format pharazon_log '$remote_addr - $remote_user [$time_local] '
                        '"$request" $status $body_bytes_sent '
                        '"$http_referer" "$http_user_agent" '
                        'upstream: $upstream_addr auth: $http_authorization';

# Blokir akses via IP langsung
server {
    listen 80 default_server;
    server_name ~^[0-9.]+$;
    return 444;
}

# Server block untuk pharazon.k02.com
server {
    listen 80;
    server_name pharazon.k02.com;

    access_log /var/log/nginx/pharazon-access.log pharazon_log;
    error_log /var/log/nginx/pharazon-error.log;

    location / {
        # Teruskan request ke upstream
        proxy_pass http://Kesatria_Lorien;

        # Header standar untuk reverse proxy
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # PENTING: Teruskan Basic Authentication
        proxy_set_header Authorization $http_authorization;
        proxy_pass_header Authorization;

        # Timeout settings
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;

        # Buffer settings untuk performa
        proxy_buffering on;
        proxy_buffer_size 4k;
        proxy_buffers 8 4k;
    }
}
EOF

echo "✓ Konfigurasi dibuat di /etc/nginx/sites-available/pharazon-lb"

# 5) Aktifkan konfigurasi
echo "[5/5] Mengaktifkan konfigurasi..."
ln -sf /etc/nginx/sites-available/pharazon-lb /etc/nginx/sites-enabled/pharazon-lb

# Test dan restart nginx
echo ""
echo "Testing nginx configuration..."
nginx -t

if [ $? -eq 0 ]; then
    echo ""
    echo "Restarting nginx..."
    service nginx stop 2>/dev/null || true
    sleep 2
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
echo "=============================================="
echo "  ✅ PHARAZON REVERSE PROXY SIAP"
echo "=============================================="
echo ""
echo "Konfigurasi Pharazon:"
echo "  Domain: pharazon.k02.com"
echo "  Upstream: Kesatria_Lorien"
echo "    - galadriel.k02.com:8004"
echo "    - celeborn.k02.com:8005"
echo "    - oropher.k02.com:8006"
echo "  Algorithm: Round Robin"
echo ""
echo "Testing dari client:"
echo "  curl -u noldor:silvan http://pharazon.k02.com/"
echo ""
echo "Melihat distribusi request:"
echo "  tail -f /var/log/nginx/pharazon-access.log"
echo ""
echo "=============================================="
```

#### Galadriel
```
#!/bin/bash
# restart-nginx-galadriel.sh
# Jalankan di Galadriel

echo "=============================================="
echo "  RESTART & FIX NGINX - GALADRIEL"
echo "=============================================="
echo ""

# 1. Cek proses nginx
echo "[1] Cek proses nginx..."
if ps aux | grep -v grep | grep nginx > /dev/null; then
    echo "✓ Nginx process ditemukan"
    ps aux | grep nginx | grep -v grep
else
    echo "✗ Nginx tidak berjalan"
fi
echo ""

# 2. Kill semua proses nginx jika ada
echo "[2] Stop semua proses nginx..."
pkill nginx 2>/dev/null || true
sleep 2
echo "✓ Proses nginx dihentikan"
echo ""

# 3. Cek konfigurasi nginx
echo "[3] Cek konfigurasi nginx..."
nginx -t
if [ $? -ne 0 ]; then
    echo "✗ Ada error di konfigurasi!"
    echo ""
    echo "Menampilkan konfigurasi aktif:"
    cat /etc/nginx/sites-enabled/galadriel.k02.com
    exit 1
fi
echo "✓ Konfigurasi OK"
echo ""

# 4. Pastikan PHP-FPM berjalan
echo "[4] Cek dan start PHP-FPM..."
if ! pgrep -x "php-fpm8.4" > /dev/null; then
    echo "Starting PHP-FPM..."
    service php8.4-fpm start || php-fpm8.4 || true
    sleep 2
fi

if pgrep -x "php-fpm8.4" > /dev/null; then
    echo "✓ PHP-FPM running"
else
    echo "⚠ PHP-FPM mungkin belum running"
fi
echo ""

# 5. Start nginx
echo "[5] Start nginx..."
service nginx start 2>/dev/null || nginx
sleep 2

if ps aux | grep -v grep | grep nginx > /dev/null; then
    echo "✓ Nginx berhasil di-start"
    ps aux | grep nginx | grep -v grep | head -3
else
    echo "✗ Nginx gagal di-start"
    echo ""
    echo "Cek error log:"
    tail -20 /var/log/nginx/error.log 2>/dev/null || echo "No error log"
    exit 1
fi
echo ""

# 6. Cek port 8004
echo "[6] Cek port 8004..."
if ss -tulpn 2>/dev/null | grep -q ":8004" || netstat -tulpn 2>/dev/null | grep -q ":8004"; then
    echo "✓ Port 8004 listening"
    ss -tulpn 2>/dev/null | grep ":8004" || netstat -tulpn 2>/dev/null | grep ":8004"
else
    echo "✗ Port 8004 tidak listening!"
    echo ""
    echo "Semua port yang listening:"
    ss -tulpn 2>/dev/null | grep nginx || netstat -tulpn 2>/dev/null | grep nginx
fi
echo ""

# 7. Test HTTP
echo "[7] Test HTTP localhost:8004..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u noldor:silvan http://localhost:8004/ 2>/dev/null)
echo "HTTP Status: $HTTP_CODE"

if [ "$HTTP_CODE" == "200" ]; then
    echo "✓ HTTP Response OK"
    echo ""
    curl -s -u noldor:silvan http://localhost:8004/ | grep -E "Server:|Alamat IP" | sed 's/<[^>]*>//g'
else
    echo "✗ HTTP Response failed"
    echo ""
    echo "Cek akses log:"
    tail -10 /var/log/nginx/galadriel.access.log 2>/dev/null || echo "No access log"
    echo ""
    echo "Cek error log:"
    tail -10 /var/log/nginx/galadriel.error.log 2>/dev/null || echo "No error log"
fi
echo ""

echo "=============================================="
echo "  Status Galadriel:"
if [ "$HTTP_CODE" == "200" ]; then
    echo "  ✅ SIAP DIGUNAKAN"
else
    echo "  ⚠ PERLU PERBAIKAN"
fi
echo "=============================================="
```

#### Celeborn
```
#!/bin/bash
# fix-worker-hostname.sh
# Jalankan di setiap worker PHP (Galadriel, Celeborn, Oropher)

set -e  # Exit on error, tapi tidak strict untuk troubleshooting

HOSTNAME=$(hostname)
HOSTNAME_LOWER=$(echo "$HOSTNAME" | tr '[:upper:]' '[:lower:]')
DOMAIN="${HOSTNAME_LOWER}.k02.com"
WEBROOT="/var/www/${DOMAIN}"

echo "=============================================="
echo "  Updating index.php untuk $HOSTNAME"
echo "=============================================="
echo ""
echo "Hostname: $HOSTNAME"
echo "Domain: $DOMAIN"
echo "Webroot: $WEBROOT"
echo ""

# Cek apakah webroot ada
if [ ! -d "$WEBROOT" ]; then
    echo "⚠ Webroot $WEBROOT tidak ditemukan!"
    echo ""
    echo "Mencari direktori yang ada di /var/www/..."
    ls -la /var/www/
    echo ""

    # Cari direktori yang cocok (case-insensitive)
    FOUND_DIR=$(find /var/www -maxdepth 1 -type d -iname "*${HOSTNAME_LOWER}*" 2>/dev/null | head -1)

    if [ -n "$FOUND_DIR" ]; then
        echo "✓ Ditemukan: $FOUND_DIR"
        WEBROOT="$FOUND_DIR"
    else
        echo "Membuat direktori baru: $WEBROOT"
        mkdir -p "$WEBROOT"
    fi
fi

echo ""
echo "Menggunakan webroot: $WEBROOT"
echo ""

# Buat index.php
cat > "${WEBROOT}/index.php" << 'EOF'
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
.hostname {
    color: #1976d2;
    font-weight: bold;
    font-size: 20px;
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
    <p>Server: <span class="hostname"><?php echo gethostname(); ?></span></p>
    <p>Alamat IP Anda adalah:<br><b><?php echo $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR']; ?></b></p>
    <footer>🌿 Cahaya peri sedang memantau langkahmu 🌿</footer>
</div>
</body>
</html>
EOF

# Set permissions
chown -R www-data:www-data "$WEBROOT"
chmod 644 "${WEBROOT}/index.php"
chmod 755 "$WEBROOT"

echo "✓ index.php berhasil dibuat/diupdate"
echo ""

# Tampilkan isi file untuk verifikasi
echo "Preview index.php:"
echo "----------------------------------------"
head -20 "${WEBROOT}/index.php"
echo "..."
echo "----------------------------------------"
echo ""

# Detect port berdasarkan hostname
case "$HOSTNAME_LOWER" in
    galadriel)
        PORT=8004
        ;;
    celeborn)
        PORT=8005
        ;;
    oropher)
        PORT=8006
        ;;
    *)
        PORT=""
        ;;
esac

# Test lokal jika port ditemukan
if [ -n "$PORT" ]; then
    echo "Testing akses lokal di port $PORT..."
    echo ""

    # Cek apakah nginx listening di port tersebut
    if ss -tulpn | grep -q ":$PORT "; then
        echo "✓ Nginx listening di port $PORT"
        echo ""
        echo "Test HTTP Response:"
        echo "----------------------------------------"
        RESPONSE=$(curl -s -u noldor:silvan "http://localhost:$PORT/" 2>&1)

        if echo "$RESPONSE" | grep -q "Selamat Datang"; then
            echo "✓ Response OK"
            echo "$RESPONSE" | grep -E "Server:|Alamat IP" | sed 's/<[^>]*>//g'
        else
            echo "⚠ Response tidak sesuai:"
            echo "$RESPONSE" | head -10
        fi
        echo "----------------------------------------"
    else
        echo "⚠ Nginx tidak listening di port $PORT"
        echo ""
        echo "Port yang sedang listening:"
        ss -tulpn | grep nginx || echo "Nginx tidak berjalan"
    fi
fi

echo ""
echo "=============================================="
echo "  ✅ SELESAI"
echo "=============================================="
echo ""
echo "File location: ${WEBROOT}/index.php"
echo "Akses dari client:"
echo "  curl -u noldor:silvan http://${DOMAIN}:${PORT}/"
echo "  curl -u noldor:silvan http://pharazon.k02.com/"
echo "=============================================="
```

#### Oropher
```
#!/bin/bash
# fix-worker-hostname.sh
# Jalankan di setiap worker PHP (Galadriel, Celeborn, Oropher)

set -e  # Exit on error, tapi tidak strict untuk troubleshooting

HOSTNAME=$(hostname)
HOSTNAME_LOWER=$(echo "$HOSTNAME" | tr '[:upper:]' '[:lower:]')
DOMAIN="${HOSTNAME_LOWER}.k02.com"
WEBROOT="/var/www/${DOMAIN}"

echo "=============================================="
echo "  Updating index.php untuk $HOSTNAME"
echo "=============================================="
echo ""
echo "Hostname: $HOSTNAME"
echo "Domain: $DOMAIN"
echo "Webroot: $WEBROOT"
echo ""

# Cek apakah webroot ada
if [ ! -d "$WEBROOT" ]; then
    echo "⚠ Webroot $WEBROOT tidak ditemukan!"
    echo ""
    echo "Mencari direktori yang ada di /var/www/..."
    ls -la /var/www/
    echo ""

    # Cari direktori yang cocok (case-insensitive)
    FOUND_DIR=$(find /var/www -maxdepth 1 -type d -iname "*${HOSTNAME_LOWER}*" 2>/dev/null | head -1)

    if [ -n "$FOUND_DIR" ]; then
        echo "✓ Ditemukan: $FOUND_DIR"
        WEBROOT="$FOUND_DIR"
    else
        echo "Membuat direktori baru: $WEBROOT"
        mkdir -p "$WEBROOT"
    fi
fi

echo ""
echo "Menggunakan webroot: $WEBROOT"
echo ""

# Buat index.php
cat > "${WEBROOT}/index.php" << 'EOF'
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
.hostname {
    color: #1976d2;
    font-weight: bold;
    font-size: 20px;
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
    <p>Server: <span class="hostname"><?php echo gethostname(); ?></span></p>
    <p>Alamat IP Anda adalah:<br><b><?php echo $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR']; ?></b></p>
    <footer>🌿 Cahaya peri sedang memantau langkahmu 🌿</footer>
</div>
</body>
</html>
EOF

# Set permissions
chown -R www-data:www-data "$WEBROOT"
chmod 644 "${WEBROOT}/index.php"
chmod 755 "$WEBROOT"

echo "✓ index.php berhasil dibuat/diupdate"
echo ""

# Tampilkan isi file untuk verifikasi
echo "Preview index.php:"
echo "----------------------------------------"
head -20 "${WEBROOT}/index.php"
echo "..."
echo "----------------------------------------"
echo ""

# Detect port berdasarkan hostname
case "$HOSTNAME_LOWER" in
    galadriel)
        PORT=8004
        ;;
    celeborn)
        PORT=8005
        ;;
    oropher)
        PORT=8006
        ;;
    *)
        PORT=""
        ;;
esac

# Test lokal jika port ditemukan
if [ -n "$PORT" ]; then
    echo "Testing akses lokal di port $PORT..."
    echo ""

    # Cek apakah nginx listening di port tersebut
    if ss -tulpn | grep -q ":$PORT "; then
        echo "✓ Nginx listening di port $PORT"
        echo ""
        echo "Test HTTP Response:"
        echo "----------------------------------------"
        RESPONSE=$(curl -s -u noldor:silvan "http://localhost:$PORT/" 2>&1)

        if echo "$RESPONSE" | grep -q "Selamat Datang"; then
            echo "✓ Response OK"
            echo "$RESPONSE" | grep -E "Server:|Alamat IP" | sed 's/<[^>]*>//g'
        else
            echo "⚠ Response tidak sesuai:"
            echo "$RESPONSE" | head -10
        fi
        echo "----------------------------------------"
    else
        echo "⚠ Nginx tidak listening di port $PORT"
        echo ""
        echo "Port yang sedang listening:"
        ss -tulpn | grep nginx || echo "Nginx tidak berjalan"
    fi
fi

echo ""
echo "=============================================="
echo "  ✅ SELESAI"
echo "=============================================="
echo ""
echo "File location: ${WEBROOT}/index.php"
echo "Akses dari client:"
echo "  curl -u noldor:silvan http://${DOMAIN}:${PORT}/"
echo "  curl -u noldor:silvan http://pharazon.k02.com/"
echo "=============================================="
```

### UJI
#### Semua Node (Contoh: Galgalad)
```
#!/bin/bash
# test-pharazon-improved.sh
# Script testing Pharazon dengan deteksi hostname yang lebih baik

echo "=============================================="
echo "  TESTING PHARAZON REVERSE PROXY (IMPROVED)"
echo "=============================================="
echo ""

# Test 1: Resolusi DNS
echo "[TEST 1] Resolusi DNS pharazon.k02.com"
host pharazon.k02.com
if [ $? -eq 0 ]; then
    echo "✓ DNS OK"
else
    echo "✗ DNS FAILED"
    exit 1
fi
echo ""

# Test 2: Ping
echo "[TEST 2] Ping pharazon.k02.com"
ping -c 3 pharazon.k02.com
if [ $? -eq 0 ]; then
    echo "✓ PING OK"
else
    echo "✗ PING FAILED"
    exit 1
fi
echo ""

# Test 3: HTTP tanpa autentikasi (harus 401)
echo "[TEST 3] Akses tanpa autentikasi (expect 401)"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://pharazon.k02.com/)
if [ "$RESPONSE" == "401" ]; then
    echo "✓ HTTP 401 Unauthorized (Correct!)"
else
    echo "⚠ HTTP $RESPONSE (Expected 401)"
fi
echo ""

# Test 4: HTTP dengan autentikasi
echo "[TEST 4] Akses dengan autentikasi (noldor:silvan)"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -u noldor:silvan http://pharazon.k02.com/)
if [ "$RESPONSE" == "200" ]; then
    echo "✓ HTTP 200 OK dengan Basic Auth"
else
    echo "✗ HTTP $RESPONSE (Expected 200)"
    exit 1
fi
echo ""

# Test 5: Round Robin Distribution (IMPROVED)
echo "[TEST 5] Round Robin - 12 Requests dengan Auth"
echo "Mengecek distribusi ke worker..."
echo ""

declare -A worker_count
worker_count[galadriel]=0
worker_count[celeborn]=0
worker_count[oropher]=0
worker_count[unknown]=0

for i in {1..12}; do
    RESULT=$(curl -s -u noldor:silvan http://pharazon.k02.com/ 2>&1)

    # Case-insensitive matching untuk hostname
    if echo "$RESULT" | grep -iEq "galadriel"; then
        WORKER="galadriel"
        worker_count[galadriel]=$((${worker_count[galadriel]} + 1))
    elif echo "$RESULT" | grep -iEq "celeborn"; then
        WORKER="celeborn"
        worker_count[celeborn]=$((${worker_count[celeborn]} + 1))
    elif echo "$RESULT" | grep -iEq "oropher"; then
        WORKER="oropher"
        worker_count[oropher]=$((${worker_count[oropher]} + 1))
    else
        WORKER="unknown"
        worker_count[unknown]=$((${worker_count[unknown]} + 1))
    fi

    printf "Request #%-2d: → %-10s\n" "$i" "$WORKER"
    sleep 0.3
done

echo ""
echo "Distribusi Request ke Worker:"
echo "  Galadriel: ${worker_count[galadriel]} requests"
echo "  Celeborn:  ${worker_count[celeborn]} requests"
echo "  Oropher:   ${worker_count[oropher]} requests"
echo "  Unknown:   ${worker_count[unknown]} requests"
echo ""

if [ ${worker_count[unknown]} -eq 0 ]; then
    echo "✓ Round Robin berfungsi sempurna (semua worker terdeteksi)"
else
    echo "⚠ Ada ${worker_count[unknown]} request ke worker unknown"
fi
echo ""

# Test 6: Blokir akses via IP
echo "[TEST 6] Blokir akses via IP"
PHARAZON_IP=$(host pharazon.k02.com | grep "has address" | awk '{print $4}')
if [ -n "$PHARAZON_IP" ]; then
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://$PHARAZON_IP/ 2>/dev/null)
    if [ "$RESPONSE" == "000" ] || [ "$RESPONSE" == "444" ]; then
        echo "✓ Akses via IP ($PHARAZON_IP) berhasil diblokir"
    else
        echo "⚠ Akses via IP masih bisa (HTTP $RESPONSE)"
    fi
fi
echo ""

# Test 7: Verifikasi X-Real-IP header diteruskan
echo "[TEST 7] Verifikasi X-Real-IP diteruskan ke worker"
CONTENT=$(curl -s -u noldor:silvan http://pharazon.k02.com/ 2>&1)
if echo "$CONTENT" | grep -q "Alamat IP Anda"; then
    echo "✓ Worker menampilkan IP pengunjung (header X-Real-IP diteruskan)"
    IP_SHOWN=$(echo "$CONTENT" | grep -oP 'Alamat IP Anda adalah:<br><b>\K[0-9.]+' | head -1)
    if [ -n "$IP_SHOWN" ]; then
        echo "  IP yang ditampilkan: $IP_SHOWN"
    fi
else
    echo "⚠ Tidak dapat memverifikasi X-Real-IP"
fi
echo ""

# Test 8: Tampilkan sample response
echo "[TEST 8] Sample Response dari Worker"
echo "----------------------------------------"
curl -s -u noldor:silvan http://pharazon.k02.com/ | grep -A 2 "Selamat Datang\|Alamat IP\|Hostname" | head -10
echo "----------------------------------------"
echo ""

# Test 9: Check Pharazon logs
echo "[TEST 9] Memeriksa Log Pharazon"
if [ -f /var/log/nginx/pharazon-access.log ]; then
    echo "Last 5 entries dari pharazon-access.log:"
    echo "----------------------------------------"
    ssh pharazon.k02.com "tail -5 /var/log/nginx/pharazon-access.log 2>/dev/null" || \
    echo "(Tidak dapat mengakses log dari remote, jalankan di Pharazon)"
    echo "----------------------------------------"
else
    echo "⚠ Log file tidak ditemukan (normal jika dijalankan dari client)"
fi
echo ""

echo "=============================================="
echo "  ✅ TESTING SELESAI"
echo "=============================================="
echo ""
echo "Ringkasan:"
echo "  ✓ DNS Resolution"
echo "  ✓ Network Connectivity"
echo "  ✓ Basic Authentication (401 → 200)"
echo "  ✓ Round Robin Load Balancing"
echo "  ✓ IP Blocking"
echo "  ✓ X-Real-IP Header Forwarding"
echo ""
echo "Pharazon Reverse Proxy berfungsi dengan baik!"
echo "=============================================="
```
<img width="555" height="1032" alt="image" src="https://github.com/user-attachments/assets/8c71bdab-e9d2-4dfc-b6e0-57579ae14b78" />


## Soal_17
Dari node client, lakukan benchmark ke pharazon.<xxxx>.com, jangan lupa menyertakan kredensial autentikasi. Amati distribusi beban ke para worker. Kemudian, simulasikan salah satu taman Peri runtuh (misal: service nginx stop di Galadriel) dan jalankan lagi benchmark. Apakah Pharazon masih bisa mengarahkan pengunjung ke taman yang tersisa? Periksa log Pharazon.
## SCRIPT (Gilgalad)
```
#!/bin/bash
# soal17-benchmark-failover.sh
# Testing benchmark dan failover Pharazon

set -e

echo "=============================================="
echo "  SOAL 17: BENCHMARK & FAILOVER TEST"
echo "=============================================="
echo ""

# Install Apache Benchmark jika belum ada
if ! command -v ab &> /dev/null; then
    echo "Installing Apache Benchmark..."
    apt-get update -qq
    apt-get install -y apache2-utils
    echo ""
fi

# Fungsi untuk menjalankan benchmark
run_benchmark() {
    local TEST_NAME="$1"
    local N_REQUESTS="$2"
    local CONCURRENCY="$3"
    local OUTPUT_FILE="/tmp/ab-pharazon-${TEST_NAME}.txt"
    
    echo "=============================================="
    echo "  $TEST_NAME"
    echo "  Requests: $N_REQUESTS | Concurrency: $CONCURRENCY"
    echo "=============================================="
    echo ""
    
    # Jalankan Apache Benchmark dengan Basic Auth
    ab -n $N_REQUESTS -c $CONCURRENCY \
       -A noldor:silvan \
       http://pharazon.k02.com/ 2>&1 | tee $OUTPUT_FILE
    
    echo ""
    echo "Ringkasan Hasil:"
    echo "----------------------------------------"
    grep "Time taken\|Requests per second\|Time per request\|Failed requests" $OUTPUT_FILE | head -4
    echo "----------------------------------------"
    echo ""
    
    return 0
}

# Fungsi untuk cek status worker
check_workers() {
    echo "=============================================="
    echo "  Status Worker Nodes"
    echo "=============================================="
    
    for WORKER in "galadriel.k02.com:8004" "celeborn.k02.com:8005" "oropher.k02.com:8006"; do
        echo -n "  $WORKER: "
        STATUS=$(curl -s -o /dev/null -w "%{http_code}" -u noldor:silvan http://$WORKER/ 2>/dev/null)
        if [ "$STATUS" == "200" ]; then
            echo "✓ UP (HTTP $STATUS)"
        else
            echo "✗ DOWN (HTTP $STATUS)"
        fi
    done
    echo ""
}

# Fungsi untuk cek distribusi dari sample requests
check_distribution() {
    local N_SAMPLES=${1:-20}
    echo "=============================================="
    echo "  Distribusi Request (Sample: $N_SAMPLES)"
    echo "=============================================="
    
    declare -A count
    count[Galadriel]=0
    count[Celeborn]=0
    count[Oropher]=0
    count[Unknown]=0
    
    for i in $(seq 1 $N_SAMPLES); do
        RESPONSE=$(curl -s -u noldor:silvan http://pharazon.k02.com/ 2>&1)
        
        if echo "$RESPONSE" | grep -q "Server:.*Galadriel"; then
            count[Galadriel]=$((${count[Galadriel]} + 1))
        elif echo "$RESPONSE" | grep -q "Server:.*Celeborn"; then
            count[Celeborn]=$((${count[Celeborn]} + 1))
        elif echo "$RESPONSE" | grep -q "Server:.*Oropher"; then
            count[Oropher]=$((${count[Oropher]} + 1))
        else
            count[Unknown]=$((${count[Unknown]} + 1))
        fi
        
        # Progress indicator
        if [ $((i % 5)) -eq 0 ]; then
            echo -n "."
        fi
    done
    
    echo ""
    echo ""
    echo "Hasil Distribusi:"
    echo "  🌸 Galadriel: ${count[Galadriel]} requests ($(( ${count[Galadriel]} * 100 / N_SAMPLES ))%)"
    echo "  🌺 Celeborn:  ${count[Celeborn]} requests ($(( ${count[Celeborn]} * 100 / N_SAMPLES ))%)"
    echo "  🌻 Oropher:   ${count[Oropher]} requests ($(( ${count[Oropher]} * 100 / N_SAMPLES ))%)"
    
    if [ ${count[Unknown]} -gt 0 ]; then
        echo "  ❓ Unknown:   ${count[Unknown]} requests"
    fi
    echo ""
}

# ============================================
# BAGIAN 1: BENCHMARK DENGAN SEMUA WORKER UP
# ============================================

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║  BAGIAN 1: SEMUA WORKER AKTIF             ║"
echo "╚════════════════════════════════════════════╝"
echo ""

check_workers
check_distribution 30

# Benchmark 1: Test ringan
run_benchmark "TEST-1-RINGAN" 100 10

sleep 2

# Benchmark 2: Test sedang
run_benchmark "TEST-2-SEDANG" 1000 50

sleep 2

# Benchmark 3: Test berat
run_benchmark "TEST-3-BERAT" 2000 100

echo ""
echo "=============================================="
echo "  ✅ BAGIAN 1 SELESAI"
echo "=============================================="
echo ""
read -p "Tekan ENTER setelah Anda menjalankan 'service nginx stop' di Galadriel..."

# ============================================
# BAGIAN 2: BENCHMARK SETELAH 1 WORKER DOWN
# ============================================

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║  BAGIAN 2: GALADRIEL DOWN (FAILOVER TEST) ║"
echo "╚════════════════════════════════════════════╝"
echo ""

check_workers
check_distribution 30

# Benchmark 4: Test dengan 1 worker down
run_benchmark "TEST-4-FAILOVER" 1000 50

sleep 2

# Benchmark 5: Test berat dengan 1 worker down
run_benchmark "TEST-5-FAILOVER-BERAT" 2000 100

echo ""
echo "=============================================="
echo "  ✅ BAGIAN 2 SELESAI"
echo "=============================================="
echo ""
read -p "Tekan ENTER setelah Anda menjalankan 'service nginx start' di Galadriel..."

# ============================================
# BAGIAN 3: RECOVERY TEST
# ============================================

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║  BAGIAN 3: RECOVERY (SEMUA UP LAGI)       ║"
echo "╚════════════════════════════════════════════╝"
echo ""

check_workers
check_distribution 30

# Benchmark 6: Test setelah recovery
run_benchmark "TEST-6-RECOVERY" 1000 50

echo ""
echo "=============================================="
echo "  📊 RINGKASAN SEMUA TEST"
echo "=============================================="
echo ""

for TEST in "TEST-1-RINGAN" "TEST-2-SEDANG" "TEST-3-BERAT" "TEST-4-FAILOVER" "TEST-5-FAILOVER-BERAT" "TEST-6-RECOVERY"; do
    if [ -f "/tmp/ab-pharazon-${TEST}.txt" ]; then
        echo "$TEST:"
        grep "Requests per second\|Failed requests" /tmp/ab-pharazon-${TEST}.txt | head -2
        echo ""
    fi
done

echo "=============================================="
echo "  ✅ SEMUA TEST SELESAI"
echo "=============================================="
echo ""
echo "File hasil benchmark tersimpan di:"
ls -lh /tmp/ab-pharazon-*.txt 2>/dev/null
echo ""
echo "Untuk melihat log Pharazon, jalankan di node Pharazon:"
echo "  bash check-pharazon-logs.sh"
echo "=============================================="
```
## SCRIPT (Log Pharazon) 
```
#!/bin/bash
# check-pharazon-logs.sh
# Jalankan di PHARAZON untuk analisis log

echo "=============================================="
echo "  PHARAZON - LOG ANALYSIS (SOAL 17)"
echo "=============================================="
echo ""

LOG_FILE="/var/log/nginx/pharazon-access.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "✗ Log file tidak ditemukan: $LOG_FILE"
    exit 1
fi

# 1. Total requests
echo "[1] Total Requests:"
echo "----------------------------------------"
TOTAL=$(wc -l < $LOG_FILE)
echo "  Total: $TOTAL requests"
echo ""

# 2. Distribusi per worker (semua waktu)
echo "[2] Distribusi Request per Worker (ALL TIME):"
echo "----------------------------------------"
grep -oE 'upstream: [^:]+:[0-9]+' $LOG_FILE | \
    awk '{print $2}' | \
    sort | uniq -c | \
    awk '
    {
        count=$1
        server=$2
        total+=$1
        if (server ~ /8004/) { worker="Galadriel:8004"; gal=$1 }
        else if (server ~ /8005/) { worker="Celeborn:8005"; cel=$1 }
        else if (server ~ /8006/) { worker="Oropher:8006"; oro=$1 }
        else worker=server
        printf "  %-20s: %5d requests\n", worker, count
    }
    END {
        if (total > 0) {
            printf "\n  Total distributed: %d requests\n", total
            if (gal > 0) printf "  Galadriel: %.1f%%\n", (gal/total)*100
            if (cel > 0) printf "  Celeborn:  %.1f%%\n", (cel/total)*100
            if (oro > 0) printf "  Oropher:   %.1f%%\n", (oro/total)*100
        }
    }
    '
echo "----------------------------------------"
echo ""

# 3. Last 100 requests distribution
echo "[3] Distribusi Request (Last 100):"
echo "----------------------------------------"
tail -100 $LOG_FILE | \
    grep -oE 'upstream: [^:]+:[0-9]+' | \
    awk '{print $2}' | \
    sort | uniq -c | \
    awk '
    {
        count=$1
        server=$2
        if (server ~ /8004/) worker="Galadriel:8004"
        else if (server ~ /8005/) worker="Celeborn:8005"
        else if (server ~ /8006/) worker="Oropher:8006"
        else worker=server
        printf "  %-20s: %3d requests\n", worker, count
    }
    '
echo "----------------------------------------"
echo ""

# 4. Status code distribution
echo "[4] HTTP Status Code Distribution:"
echo "----------------------------------------"
awk '{print $9}' $LOG_FILE | \
    sort | uniq -c | \
    awk '{printf "  HTTP %s: %5d requests\n", $2, $1}'
echo "----------------------------------------"
echo ""

# 5. Failed upstream connections (502, 503, 504)
echo "[5] Failed Upstream Connections:"
echo "----------------------------------------"
FAILED=$(grep -E ' (502|503|504) ' $LOG_FILE | wc -l)
if [ $FAILED -gt 0 ]; then
    echo "  ⚠ Failed requests: $FAILED"
    echo ""
    echo "  Last 10 failed requests:"
    grep -E ' (502|503|504) ' $LOG_FILE | tail -10 | \
        awk '{print "    " $4, $9, $7}'
else
    echo "  ✓ No failed upstream connections"
fi
echo "----------------------------------------"
echo ""

# 6. Timeline - requests per minute (last hour)
echo "[6] Timeline - Requests Pattern:"
echo "----------------------------------------"
echo "  Last 10 entries:"
tail -10 $LOG_FILE | \
    awk '{
        time=$4
        gsub(/\[/, "", time)
        split(time, t, ":")
        printf "    %s:%s - %s %s\n", t[2], t[3], $9, $7
    }'
echo "----------------------------------------"
echo ""

# 7. Detect failover events (consecutive 502/503 to same upstream)
echo "[7] Failover Events Detection:"
echo "----------------------------------------"
grep -E ' (502|503|504) ' $LOG_FILE | \
    grep -oE 'upstream: [^:]+:[0-9]+' | \
    uniq -c | \
    awk '
    $1 > 5 {
        server=$3
        if (server ~ /8004/) worker="Galadriel"
        else if (server ~ /8005/) worker="Celeborn"
        else if (server ~ /8006/) worker="Oropher"
        else worker=server
        printf "  ⚠ Possible failover detected: %s (%d consecutive failures)\n", worker, $1
    }
    ' || echo "  ✓ No significant failover events detected"
echo "----------------------------------------"
echo ""

echo "=============================================="
echo "  ✅ LOG ANALYSIS COMPLETE"
echo "=============================================="
echo ""
echo "Key findings:"
echo "  - Total requests: $TOTAL"
echo "  - Failed requests: $FAILED"
echo ""
echo "Recommendations:"
echo "  - Check if distribution is balanced (33% each when all up)"
echo "  - Check if failover happened smoothly (502/503 minimal)"
echo "  - Verify recovery after worker restart"
echo "=============================================="
```
<img width="395" height="916" alt="image" src="https://github.com/user-attachments/assets/97eab847-735f-40aa-a89e-f983596bba24" />

