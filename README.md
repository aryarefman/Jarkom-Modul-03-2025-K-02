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
    address 192.212.5.1
    netmask 255.255.255.0

# Switch5 - Clients (Khamul, Erendis, Amdir via Switch8→Switch6)
auto eth3
iface eth3 inet static
    address 192.212.2.1
    netmask 255.255.255.0

# Switch4 - Services (Aldarion, Palantir, Narvi)
auto eth4
iface eth4 inet static
    address 192.212.3.1
    netmask 255.255.255.0

# Minastir (Direct Connection)
auto eth5
iface eth5 inet static
    address 192.212.6.1
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

### Elendil
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

### Isildur
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

### Anarion
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

### Gigalad
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

### Celebrimbor
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.5.3
    netmask 255.255.255.0
    gateway 192.212.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Pharazon
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.5.4
    netmask 255.255.255.0
    gateway 192.212.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Aldarion
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

### Palantir
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

### Narvi
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

### Miriel
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

### Amandil
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

### Elros
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

### Khamul
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

### Erendis
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

### Amdir
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

### Galadriel
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.5.5
    netmask 255.255.255.0
    gateway 192.212.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Celeborn
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.5.6
    netmask 255.255.255.0
    gateway 192.212.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Oropher
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.5.7
    netmask 255.255.255.0
    gateway 192.212.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Minastir
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.6.2
    netmask 255.255.255.0
    gateway 192.212.6.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

## UJI
### Semua Node selain Durin (Contoh: Isildur)
<img width="1128" height="506" alt="image" src="https://github.com/user-attachments/assets/3ad9eb68-09b7-4000-a89c-e171d2dd0d9e" />
