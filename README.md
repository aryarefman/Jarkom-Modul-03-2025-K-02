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

# Script instalasi Laravel dengan Nginx dan PHP 8.2
# Usage: bash soal7.sh

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
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git resource-laravel-k1
cd resource-laravel-k1

# Install dependencies
echo "=== Installing Laravel dependencies ==="
composer install
composer update

# Setup environment
echo "=== Setting up environment ==="
cp .env.example .env
php artisan key:generate

# Verify installation
ls -la /var/www/resource-laravel-k1/
cat /var/www/resource-laravel-k1/.env
ls /var/www/resource-laravel-k1/vendor/
php artisan --version

# Configure Nginx
echo "=== Configuring Nginx ==="
cat > /etc/nginx/sites-available/laravel << 'EOF'
server {
    listen 80;
    server_name localhost;
    root /var/www/resource-laravel-k1/public;
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
    index index.php;
    charset utf-8;
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }
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
ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Set permissions
echo "=== Setting permissions ==="
cd /var/www/resource-laravel-k1
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache

# Start services
echo "=== Starting PHP-FPM ==="
service php8.2-fpm start
ls /run/php/

# Test and restart Nginx
echo "=== Testing and restarting Nginx ==="
nginx -t
service nginx restart

echo "=== Instalasi selesai! ==="
echo "Laravel dapat diakses di: http://localhost"
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

echo "=== [SOAL 8] Setup ELENDIL → port 8001 ==="

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
    listen 8001;
    server_name elendil.k02.com;

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
    if ($host != "elendil.k02.com") {
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
echo "✓✓✓ ELENDIL SIAP → http://elendil.k02.com:8001"
echo "Testing API endpoint..."
sleep 2
curl -s http://localhost:8001/api/airing
echo ""
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
# soal10-elros.sh — Setup Load Balancer untuk Laravel Workers
# Jalankan di Elros

echo "=== [SOAL 10] Setup ELROS sebagai Load Balancer ==="

# 1. Install Nginx
echo "=== [1/5] Install Nginx ==="
apt-get update
apt-get install -y nginx

# 2. Hapus konfigurasi default
echo "=== [2/5] Hapus konfigurasi default ==="
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-enabled/laravel

# 3. Buat konfigurasi Load Balancer
echo "=== [3/5] Buat konfigurasi Load Balancer ==="
cat > /etc/nginx/sites-available/load-balancer << 'EOF'
# Upstream untuk Laravel Workers (Round Robin)
upstream kesatria_numenor {
    server elendil.k02.com:8001;
    server isildur.k02.com:8002;
    server anarion.k02.com:8003;
}

server {
    listen 80;
    server_name elros.k02.com;

    location / {
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # Blokir akses via IP
    if ($host != "elros.k02.com") {
        return 444;
    }
}
EOF

# 4. Aktifkan konfigurasi
echo "=== [4/5] Aktifkan konfigurasi ==="
ln -sf /etc/nginx/sites-available/load-balancer /etc/nginx/sites-enabled/

# 5. Test dan restart Nginx
echo "=== [5/5] Test dan restart Nginx ==="
nginx -t
if [ $? -eq 0 ]; then
    service nginx restart
    echo "✓ Nginx berhasil di-restart"
else
    echo "✗ Nginx configuration error"
    exit 1
fi

echo ""
echo "✅ ELROS Load Balancer siap!"
echo "   Domain: http://elros.k02.com"
echo "   Backend Workers:"
echo "   - elendil.k02.com:8001"
echo "   - isildur.k02.com:8002"
echo "   - anarion.k02.com:8003"
echo "   Algoritma: Round Robin"
echo ""
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

## Soal_12
Para Penguasa Peri (Galadriel, Celeborn, Oropher) membangun taman digital mereka menggunakan PHP. Instal nginx dan php8.4-fpm di setiap node worker PHP. Buat file index.php sederhana di /var/www/html masing-masing yang menampilkan nama hostname mereka. Buat agar akses web hanya bisa melalui domain nama, tidak bisa melalui ip.

## Galadriel,Celeborn,Oropher
## 1. Install Nginx dan PHP 8.4-FPM
```
apt update
apt install nginx php8.4-fpm -y
```
## 2. Cek dan jalankan manual
```
systemctl enable nginx php8.4-fpm
systemctl start nginx php8.4-fpm
```
Jika muncul 
```
System has not been booted with systemd as init system (PID 1). Can't operate.
```
Jalankan 
```
service nginx start
service php8.4-fpm start
```
```
ps aux | grep nginx
ps aux | grep php-fpm
```
## 3. Buat file web sederhana
```
echo "<?php echo 'Halo, saya Galadriel 🌸'; ?>" > /var/www/html/index.php
```
```
cat /var/www/html/index.php
```
## 4. Buat virtual host
```
nano /etc/nginx/sites-available/galadriel.k02.com
```
```
server {
    listen 80;
    server_name galadriel.k02.com;

    root /var/www/html;
    index index.php index.html index.htm;

    # Blok akses langsung via IP
    if ($host ~* ^\d+\.\d+\.\d+\.\d+$) {
        return 444;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    access_log /var/log/nginx/galadriel.access.log;
    error_log /var/log/nginx/galadriel.error.log;
}
```

## 5. Aktifkan situs
```
ln -s /etc/nginx/sites-available/galadriel.k02.com /etc/nginx/sites-enabled/
```
## Pastikan hanya ada symlink yang valid
```
ls -l /etc/nginx/sites-enabled/
```
## hapus symlink jika ada yang lain
```
rm /etc/nginx/sites-enabled/galadriel.k02.com
```
## 6. Tes konfigurasi & reload
```
nginx -t
service nginx reload
```
## UJI HASIL 
Uji di Khamul 

```
curl galadriel.k02.com
```

<img width="386" height="64" alt="image" src="https://github.com/user-attachments/assets/54df0945-3aeb-430b-9129-e640e67e0707" />

