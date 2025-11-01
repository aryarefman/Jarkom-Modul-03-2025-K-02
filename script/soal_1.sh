Durin
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
/root/.bashrc
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
Elendil
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.2
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Isildur
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.3
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Anarion
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.4
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Gigalad
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.2
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Celebrimbor
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.3
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Pharazon
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.4
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Aldarion
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.4.2
    netmask 255.255.255.0
    gateway 192.212.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Palantir
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.4.3
    netmask 255.255.255.0
    gateway 192.212.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Narvi
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.4.4
    netmask 255.255.255.0
    gateway 192.212.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Miriel
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.5
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Amandil
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.7
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Elros
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.1.6
    netmask 255.255.255.0
    gateway 192.212.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Khamul
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.3.2
    netmask 255.255.255.0
    gateway 192.212.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Erendis
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.3.3
    netmask 255.255.255.0
    gateway 192.212.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Amdir
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.3.4
    netmask 255.255.255.0
    gateway 192.212.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Galadriel
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.5
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Celeborn
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.6
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Oropher
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.2.7
    netmask 255.255.255.0
    gateway 192.212.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
Minastir
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.212.5.2
    netmask 255.255.255.0
    gateway 192.212.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf