# Product Requirements Document (PRD)
**Project**: Aplikasi Mobile Pemesanan Dessert & Minuman (F&B)  
**Platform**: Flutter (Android & iOS)  
**Target User**: Konsumen/Mahasiswa  
**Basis Desain**: Figma File *"Projek"* (Page 2)

---

## 1. Latar Belakang & Tujuan
Projek ini merupakan tugas kuliah pemrograman mobile semester 5 (Teknik Informatika) untuk mengimplementasikan rancangan antarmuka (UI/UX) dari Figma ke dalam aplikasi mobile berbasis **Flutter**.

Aplikasi ini berfokus pada pengalaman pemesanan makanan/dessert manis (seperti donat/dessert dengan aneka varian rasa dan topping) dengan antarmuka yang modern, responsif, dan mudah digunakan.

---

## 2. Ruang Lingkup Sistem (Scope)
Aplikasi dikembangkan menggunakan arsitektur **Client-Server**:
1. **Frontend Mobile (Client)**: 100% Flutter framework dengan antarmuka presisi (*pixel-perfect*) sesuai Figma.
2. **Backend API (Server)**: RESTful API berbasis **Laravel** (PHP) yang menangani logika bisnis, validasi, dan autentikasi.
3. **Database Layer**: Database relasional **MySQL** untuk menyimpan data pengguna, menu donat, topping, keranjang, dan riwayat pesanan secara permanen (*real persistence*).
4. **State & Networking**: Integrasi HTTP Client di Flutter (`http` / `dio`) dengan penanganan status respons JSON, session token, dan mekanisme *fallback/offline mode*.

---

## 3. Fitur Utama & Alur Pengguna (User Journey)

### 3.1. Onboarding & Splash Screen
* **Tujuan**: Memperkenalkan brand dan menyambut pengguna pertama kali.
* **Elemen**:
  * Logo & grafis utama dengan sudut rounded khas.
  * Tagline inspiratif: *"ENJOY YOUR FOOD"*.
  * Tombol CTA utama: *"GET STARTED"*.
* **Aksi**: Menekan tombol akan mengarahkan pengguna ke halaman Login.

### 3.2. Autentikasi & Manajemen Sesi Pengguna
* **Tujuan**: Gerbang masuk pengguna dan inisialisasi sesi dinamis.
* **Fitur Dinamis**:
  * Input Form: Username/Email dan Password dengan validasi format.
  * **Sesi Login Dinamis**: Username yang diinput saat login/register digunakan secara otomatis sebagai identitas aktif di Beranda (*"Hallo, [Nama]!"*) dan Profil.
  * **Penyimpanan Sesi (Session Persistence)**: Pengguna yang sudah login tidak perlu mengulang proses onboarding/login saat aplikasi dibuka kembali.
  * Opsi Social Login & Navigasi silang Login $\leftrightarrow$ Register.

### 3.3. Beranda (Home Dashboard Interaktif)
* **Tujuan**: Pusat aktivitas, notifikasi, promo, dan menu terpopuler.
* **Fitur Dinamis Beranda (Living System)**:
  1. **Header Pengguna Terpersonalisasi**:
     * Sapaan dinamis sesuai akun yang sedang login (*"Hallo, [Nama Pengguna]!"*), bersumber dari sesi login aktif.
     * Avatar profil dinamis (menampilkan foto pengguna) dan dapat diklik untuk navigasi instan ke tab Profil.
  2. **Pusat Notifikasi & Lonceng Hidup (Notification Center)**:
     * Badge angka reaktif yang menghitung jumlah notifikasi belum dibaca (`unread count`). Jika seluruh notifikasi sudah dibaca, badge angka otomatis menghilang.
     * Lembar Notifikasi Interaktif (*Notification Sheet*): Memuat daftar notifikasi riil (pembaruan status pesanan *"Pesanan Siap!"*, *"Driver sedang menuju lokasi"*, atau kupon diskon baru).
     * Tombol aksi cepat: *"Tandai Semua Dibaca"* dan tombol *"Lihat Pesanan"* yang langsung mengarahkan ke tab *My Order*.
  3. **Pencarian Terintegrasi (Live Search Bar)**:
     * Input teks pada search bar memiliki *listener* dan *onSubmitted*. Saat user mengetik kata kunci (misal *"Coklat"* atau *"Taro"*) dan menekan cari/enter, aplikasi otomatis membuka halaman Katalog Menu dengan filter pencarian tersebut langsung aktif.
  4. **Banner Promo & Dompet Kupon (Coupon Wallet)**:
     * Tombol *"Ambil"* pada banner carousel otomatis mengklaim dan menyimpan kode promo ke dalam dompet kupon pengguna (`claimedCoupons`).
     * Kupon yang sudah diambil akan otomatis terdeteksi pada layar pemesanan/detail donat untuk memotong total biaya.
  5. **Pengaturan & Logout Sesi Bersih (Clean Session Logout)**:
     * Ikon gear pengaturan di header menyediakan opsi keluar akun yang secara resmi menghapus Bearer Token dan data sesi lokal (`SharedPreferences.clear()`).
  6. **Daftar Donat "BEST SELLER"**:
     * Menampilkan 3 donat terfavorit (Tiramizu, Coklat, Matcha) bersumber langsung dari master data menu lokal (`DummyData.products`).
     * Tombol *"PESAN"* membuka detail produk untuk kustomisasi topping, jumlah pesanan, dan checkout.
  7. **Bottom Navigation Bar**:
     * Indikator aktif dan sinkronisasi navigasi lintas tab (Beranda, Menu, Pesanan, Profil).

### 3.4. Katalog Varian Rasa (Menu Explorer)
* **Tujuan**: Eksplorasi 6 varian donat khas SweetBite dengan pencarian dan belanja fleksibel.
* **Fitur Dinamis**:
  1. **Master Data Menu Lokal Terstruktur**:
     * Menyediakan 6 rasa khas donat (Coklat, Strawberi, Taro, Matcha, Tiramisu, Mix Rasa) menggunakan master data lokal terstruktur, menjaga aplikasi tetap ringan, cepat, dan fokus pada produk utama.
  2. **Live Filter & Integrasi Search Beranda**:
     * Live search real-time berdasarkan input pencarian nama rasa.
     * Menerima parameter pencarian awal dari Search Bar Beranda (`initialSearchQuery`) sehingga otomatis terfilter saat user datang dari Beranda.
  3. **Ikon Keranjang Belanja Aktif (Cart Badge & Sheet)**:
     * Dilengkapi badge angka jumlah item di pojok kanan atas header yang reaktif terhadap isi keranjang.
     * Klik ikon membuka *Shopping Cart Sheet* untuk mengelola belanjaan dan checkout multi-produk.
  4. **Pemesanan Fleksibel (Direct Order & Quick Cart)**:
     * Klik kartu/tombol "PESAN": Membuka detail kustomisasi topping dan jumlah.
     * Dukungan aksi cepat tambah ke keranjang agar pembeli bisa memilih beberapa donat berbeda sekaligus.


### 3.5. Detail Produk & Sistem Pemesanan Fleksibel
* **Tujuan**: Kustomisasi produk, pemilihan topping, alamat kirim, metode bayar, dan fleksibilitas pemesanan.
* **Fitur Dinamis**:
  1. **Alamat Pengiriman Dinamis**:
     * Terhubung otomatis dengan profil user aktif.
     * Tombol *"Ubah"* membuka dialog input alamat pengantaran baru yang langsung memperbarui tujuan pengiriman pesanan.
  2. **Topping Selector & Counter Kuantitas**:
     * Dropdown *"Tambah Toping"* interaktif (Oreo, Chocochip, Sprinkle, Kacang Almond, Keju) dengan penambahan harga seketika ke subtotal.
     * Counter jumlah pesanan (`-` / `+`) yang secara reaktif menghitung ulang rincian biaya.
  3. **Voucher Terintegrasi (Kupon Promo Beranda)**:
     * Mendukung pemakaian kupon promo yang telah diklaim dari banner Beranda via tombol cepat *"Gunakan Kupon Tersimpan"*, serta input manual kode kupon.
  4. **Metode Pembayaran Fleksibel**:
     * Pengguna dapat memilih metode pembayaran: E-Wallet (DANA / GoPay), Tunai/COD (Cash on Delivery), atau Transfer Bank.
  5. **Dual Aksi Pembelian**:
     * Tombol *"Tambah ke Keranjang"*: Menampung varian donat + topping ke dalam keranjang belanja untuk belanja multi-produk.
     * Tombol CTA *"PESAN SEKARANG"*: Memproses pesanan instan langsung menuju konfirmasi pembayaran.

### 3.6. Alur Pembayaran & Konfirmasi (Checkout Lifecycle)
* **Tujuan**: Penyelesaian transaksi pemesanan dengan pencatatan invoice resmi dan pemicu notifikasi.
* **Fitur Dinamis**:
  1. **Simulasi Loading Transaksi**: Indikator proses pembayaran (1.5 detik) sesuai prototype Figma.
  2. **Penerbitan Kode Invoice Unik**: Menghasilkan ID pesanan resmi (misal: `#ORD-20261024-001`).
  3. **Pemicu Notifikasi Otomatis**: Transaksi sukses otomatis mengirim notifikasi baru ke Lonceng Beranda (*"Pesanan #ORD... Berhasil Dibuat & Sedang Diproses!"*).
  4. **Pencatatan Pesanan Aktif**: Pesanan baru otomatis masuk ke urutan teratas (index 0) di tab *My Order*.
  5. **Navigasi Pascabayar**: Opsi kembali ke Beranda atau langsung memantau perjalanan kurir di *My Order*.

### 3.7. Pesanan Saya (Order Lifecycle & Tracking)
* **Tujuan**: Memantau perjalanan pesanan donat secara bertahap, interaktif, dan permanen.
* **Fitur Dinamis**:
  1. **Siklus Status Pesanan 3 Tahap (Order Lifecycle)**:
     * `Diproses` (Kuning/Oranye): Dapur sedang menyiapkan dan mengemas donat pesanan.
     * `Sedang Diantar (delivery)` (Hijau Terang): Kurir sedang menuju ke alamat pengiriman.
     * `Selesai` (Hijau/Abu-abu Sukses): Pesanan telah diterima pembeli.
  2. **Tombol Aksi "Pesanan Diterima"**:
     * Pada kartu pesanan berstatus `delivery`, terdapat tombol konfirmasi penerimaan.
     * Menekan tombol ini memperbarui status pesanan menjadi `Selesai` dan mengirimkan notifikasi penutupan transaksi ke Lonceng Beranda.
  3. **Lembar Struk Digital / Invoice Lengkap (Order Detail Sheet)**:
     * Kartu pesanan interaktif (dapat diklik) untuk membuka rincian: No. Invoice (`#ORD-XXXX`), tanggal & waktu, alamat tujuan, metode bayar (DANA/COD), rincian subtotal per item, dan tombol bantuan CS.
  4. **Ikon Header Interaktif**:
     * Ikon keranjang membuka keranjang belanja dan ikon gear membuka pengaturan/logout akun.
  5. **Penyimpanan Permanen (Order Persistence)**:
     * Riwayat transaksi tersimpan permanen di database MySQL (tabel `orders` & `order_items`) dan memori lokal HP sehingga tidak hilang saat aplikasi ditutup.


### 3.8. Profil Pengguna & Pengaturan Akun (User Profile Management)
* **Tujuan**: Manajemen identitas dinamis, foto profil, dan keamanan akun pengguna.
* **Fitur Dinamis**:
  1. **Identitas Akun Dinamis**:
     * Biodata dan email dibaca langsung dari sesi pengguna aktif (`SharedPreferences` / API `GET /api/profile` di tabel MySQL `users`).
     * Jika pengguna login dengan akun berbeda, profil otomatis menyesuaikan identitas akun tersebut.
  2. **Ubah Foto Profil (Galeri & Kamera)**:
     * Mengintegrasikan pemilihan gambar dari galeri HP atau kamera.
     * Foto yang dipilih langsung memperbarui avatar Profil dan otomatis sinkron ke avatar bulat di Header Beranda.
  3. **Penyimpanan Permanen Biodata (Tombol "Simpan")**:
     * Pengeditan Nama, Bio, Jenis Kelamin, Tgl Lahir, No. HP, dan Email tersimpan permanen ke database MySQL (`PUT /api/profile`) dan penyimpanan lokal HP.
     * Perubahan nama pengguna di Profil otomatis memperbarui teks sapaan di Beranda (*"Hallo, [Nama Baru]!"*).
  4. **Verifikasi Modal Ubah Kata Sandi**:
     * Validasi keamanan dengan memverifikasi kecocokan sandi lama (`Hash::check`) di database sebelum mengizinkan pembaruan sandi baru.
  5. **Logout Sesi Bersih (Secure Clean Session Logout)**:
     * Menghapus Bearer Token & profil dari `SharedPreferences` (`clear()`) dan merevokasi token di server (`POST /api/logout`).


### 3.9. Layar Chat Bantuan
* **Tujuan**: Ruang komunikasi bantuan seputar pesanan dan layanan donat.
* **Fitur Dinamis**:
  * Riwayat percakapan dengan bubble pesan pelanggan dan balasan otomatis (*Auto-reply CS*).
  * Input bar interaktif dengan tombol kirim pesan.


---

---

## 4. Peta Interaksi Prototype Figma (Interactive Prototype Flow)
Berdasarkan data 123 node transisi prototype yang ada di file Figma, berikut adalah alur interaksi dinamis yang dirancang:

### 4.1. Alur Transisi Layar (Screen Navigation Flow)
1. **Layar Onboarding & Auth**:
   * Klik tombol *"GET STARTED"* pada Onboarding $\rightarrow$ Navigasi ke Layar Login.
   * Klik *"Submit"* pada Login $\rightarrow$ Navigasi ke Beranda (*Home Screen*).
   * Klik *"Dont have account? register"* $\rightarrow$ Navigasi ke Layar Register.
2. **Layar Beranda $\rightarrow$ Katalog & Detail**:
   * Klik *"View All"* pada Beranda $\rightarrow$ Membuka Layar *Varian Rasa* (`iPhone 16 Pro - 5`).
   * Klik kartu produk atau tombol *"PESAN"* di Katalog $\rightarrow$ Membuka Layar *Detail Produk* (`iPhone 16 Plus - 11/14/15/16/17/18`).
3. **Layar Detail $\rightarrow$ Proses Pembayaran $\rightarrow$ Sukses**:
   * Klik tombol *"PESAN"* di Layar Detail (`Rectangle 34`) $\rightarrow$ Muncul transisi Layar Loading (`Frame 20`, durasi 600ms).
   * Layar Loading otomatis berpindah ke Layar Pembayaran Berhasil (`Frame 19`, durasi 600ms).
   * Klik ikon tombol kembali (*arrow*) di layar sukses $\rightarrow$ Kembali ke Beranda (`iPhone 16 Pro - 2`).
4. **Menu Pengaturan / Navigasi Cepat (`iPhone 16 Pro - 10`)**:
   * Ikon Setting di Beranda membuka lembar menu dengan 4 pilihan:
     1. Menu 1 $\rightarrow$ Buka Layar Edit Profil (`profil`: Foto, Bio, Gender, Tgl Lahir, No. HP, Email).
     2. Menu 2 $\rightarrow$ Buka Layar Ubah Kata Sandi (`iPhone 16 Pro - 16`).
     3. Menu 3 $\rightarrow$ Buka Layar Pesanan Saya (`iPhone 16 Pro - 11` / *My Order*).
     4. Menu 4 $\rightarrow$ Logout kembali ke Layar Login (`iPhone 16 Pro - 4`).
5. **Layar Obrolan Bantuan (`iPhone 16 Pro - 12` & `14`)**:
   * Ikon pesan/chat di Beranda membuka ruang chat.
   * Klik tombol *"X"* (`Frame 36`) $\rightarrow$ Menutup chat dan kembali ke Beranda.

---

### 4.2. State Komponen Interaktif (Micro-Interactions)
1. **Dropdown Pemilih Topping (`gabung` #123:443)**:
   * State Default: Menampilkan topping terpilih dengan panah dropdown.
   * State Expanded (`Frame 28`): Membuka opsi *Oreo*, *Kacang almond*, *Keju*, *Chocochip*, dan *Sprinkle*.
   * State Selected: Menutup kembali dan memperbarui topping yang aktif.
2. **Counter Kuantitas Pesanan (`Component 2` #125:598)**:
   * State 1 (`Frame 29`): Menampilkan angka `1`.
   * Klik tombol `+` (`Group 39`, durasi 200ms) $\rightarrow$ Berpindah ke State 2 (`Frame 30`, angka `2`).
   * Klik tombol `+` lagi $\rightarrow$ Berpindah ke State 3 (`Frame 31`, angka `3`).
   * Klik tombol `-` (`Group 38`, durasi 200ms) $\rightarrow$ Mengurangi jumlah kuantitas.
3. **Tombol Aksi PESAN (`Component 3` #342:1083)**:
   * State Normal: Tombol ungu (`#431BC6` / `#8968F6`).
   * State Pressed/Aktif: Berubah warna menjadi hijau konfirmasi (`rgba(123, 242, 118, 0.89)` / `#7BF276`) dengan animasi feedback sentuh.

---

## 5. Kriteria Keberhasilan (Acceptance Criteria)
1. Seluruh transisi prototype Figma dapat dijalankan di Flutter tanpa terputus.
2. Komponen interaktif (counter kuantitas, dropdown topping, dan feedback tombol) hidup dan responsif terhadap sentuhan pengguna.
3. Tampilan UI menyerupai desain Figma (warna, layout, sudut lengkung/border radius, dan tipografi).
4. Kode terstruktur rapi ke dalam folder komponen/widgets, bebas error, serta mudah dibaca.
5. Terintegrasi dengan Backend REST API Laravel & Database MySQL sehingga data tidak hilang saat restart.

---

## 6. Spesifikasi Backend Laravel & Database MySQL

### 6.1. Skema Database Relasional (MySQL)
1. **`users`**:
   * `id`, `name`, `email`, `password`, `bio`, `gender`, `birth_date`, `phone`, `avatar`, `created_at`
2. **`cart_items`**:
   * `id`, `user_id`, `product_id`, `topping_name` (nullable), `quantity`, `created_at`
3. **`orders`**:
   * `id`, `order_code`, `user_id`, `total_price`, `payment_method`, `delivery_address`, `status` (`cooking`, `delivery`, `completed`), `created_at`
4. **`order_items`**:
   * `id`, `order_id`, `product_name`, `topping_name` (nullable), `quantity`, `subtotal`
5. **`notifications`**:
   * `id`, `user_id`, `title`, `message`, `type` (`order`, `promo`, `system`), `is_read`, `created_at`
6. **`claimed_coupons`**:
   * `id`, `user_id`, `coupon_code`, `discount_amount`, `is_used`, `created_at`

*(Catatan: Master varian donat 6 rasa khas dikelola melalui master data lokal terstruktur di Flutter `DummyData.products` untuk performa instan dan stabilitas tinggi).*

### 6.2. Daftar Endpoint REST API Laravel
| Method | Endpoint | Fungsi | Payload / Response |
| :--- | :--- | :--- | :--- |
| `POST` | `/api/register` | Mendaftarkan akun baru | `{name, email, password}` $\rightarrow$ Token & User |
| `POST` | `/api/login` | Autentikasi pengguna | `{email, password}` $\rightarrow$ Token & User |
| `POST` | `/api/logout` | Revokasi sesi login pengguna | Bearer Token $\rightarrow$ Status Sukses |
| `GET` | `/api/notifications`| Mengambil daftar notifikasi | List notifikasi & `unread_count` |
| `PUT` | `/api/notifications/read-all` | Menandai semua notif dibaca | Update `is_read = 1` |
| `GET` | `/api/cart` | Mengambil isi keranjang belanja| List item di keranjang & total |
| `POST` | `/api/cart` | Menambah donat ke keranjang | `{product_name, topping, quantity}` |
| `DELETE`| `/api/cart/{id}` | Menghapus item dari keranjang | ID item keranjang |
| `POST` | `/api/checkout` | Membuat transaksi pesanan baru| `{items, address, payment_method, coupon}` $\rightarrow$ Invoice |
| `GET` | `/api/orders` | Mengambil riwayat pesanan | List pesanan aktif & riwayat |
| `PUT` | `/api/orders/{id}/complete` | Konfirmasi pesanan diterima | Update status $\rightarrow$ `completed` |
| `PUT` | `/api/profile` | Memperbarui biodata pengguna | `{name, bio, phone, birth_date}` |
| `PUT` | `/api/profile/password` | Verifikasi & ubah kata sandi| `{old_password, new_password}` |


