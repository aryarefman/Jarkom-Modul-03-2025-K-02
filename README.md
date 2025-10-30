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
