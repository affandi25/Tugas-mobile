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
Agar sesuai dengan tingkat materi kuliah saat ini, aplikasi dibuat dengan arsitektur **Clean & Simple**:
1. **Frontend**: 100% Flutter framework dengan styling pixel-perfect sesuai Figma.
2. **Data Layer**: Menggunakan model Dart dan data lokal (*dummy/mock data*) sehingga aplikasi langsung interaktif tanpa harus bergantung pada database backend/API eksternal yang rumit.
3. **State Management**: Menggunakan `StatefulWidget` bawaan Flutter (`setState`), sangat ideal agar kode mudah dipahami dan dijelaskan saat asistensi/presentasi tugas ke dosen.

---

## 3. Fitur Utama & Alur Pengguna (User Journey)

### 3.1. Onboarding & Splash Screen
* **Tujuan**: Memperkenalkan brand dan menyambut pengguna pertama kali.
* **Elemen**:
  * Logo & grafis utama dengan sudut rounded khas.
  * Tagline inspiratif: *"ENJOY YOUR FOOD"*.
  * Tombol CTA utama: *"GET STARTED"*.
* **Aksi**: Menekan tombol akan mengarahkan pengguna ke halaman Login.

### 3.2. Autentikasi (Login & Register)
* **Tujuan**: Gerbang masuk pengguna ke dalam aplikasi.
* **Fitur**:
  * Input Form: Email/Username dan Password.
  * Tombol aksi: *"Submit"*.
  * Opsi Social Login: Tombol login alternatif (Google, Apple, dll.).
  * Navigasi silang: Tautan *"Don't have account? Register"* dan sebaliknya.
  * Validasi sederhana (field tidak boleh kosong).

### 3.3. Beranda (Home Dashboard)
* **Tujuan**: Menampilkan menu terpopuler, promosi, dan navigasi cepat.
* **Fitur**:
  * Header User: Greeting personal (*"Hallo, Yusuf Affandi!"*), avatar bulat, dan ikon notifikasi lonceng dengan badge angka.
  * Kolom Pencarian (*Search Bar*): Input pencarian menu.
  * Banner Promo: Menampilkan penawaran diskon dengan background gradien emas/karamel.
  * Bagian *"BEST SELLER"*: Daftar horizontal produk terlaris dengan foto, nama, dan harga.
  * Bottom Navigation Bar: Menu navigasi utama (Home, Katalog, Order, Profil).

### 3.4. Katalog Varian Rasa (Menu Explorer)
* **Tujuan**: Memungkinkan pengguna melihat semua kategori dan rasa produk.
* **Fitur**:
  * Filter/List Kategori: *Rasa Coklat, Rasa Strawberi, Rasa Taro, Rasa Matcha, Rasa Tiramisu, dan Mix Rasa*.
  * Kartu produk dengan visual menarik, nama varian, dan tombol pilih.

### 3.5. Detail Produk & Kustomisasi Topping
* **Tujuan**: Halaman detail untuk menyesuaikan pesanan sebelum checkout.
* **Fitur**:
  * Foto produk resolusi tinggi dengan deskripsi rasa.
  * **Pilihan Topping (Chips Multi-Select)**:
    * Oreo
    * Chocochip
    * Sprinkle
    * Kacang Almond
    * Keju
  * **Quantity Counter**: Tombol `-` dan `+` untuk mengatur jumlah pesanan.
  * Tombol CTA utama: *"PESAN"* untuk memasukkan ke pesanan.

### 3.6. Alur Pembayaran & Konfirmasi
* **Tujuan**: Menyelesaikan transaksi pemesanan.
* **Fitur**:
  * Loading Indicator interaktif: *"Pembayaran anda sedang diproses silahkan tunggu....."*.
  * Dialog/Layar Sukses: *"Pembayaran anda berhasil"*.
  * Tombol navigasi kembali ke Beranda atau ke halaman *My Order*.

### 3.7. Pesanan Saya (My Order Tracking)
* **Tujuan**: Memantau pesanan yang sedang diproses.
* **Fitur**:
  * List pesanan aktif beserta varian: *Rasa Taro, Rasa Coklat, Rasa Tiramizu, Rasa Matcha*.
  * Label status pengiriman: `Order Status : delivery` dengan badge warna cerah.
  * Informasi total pembayaran (contoh di Figma: `Total : Rp 26.000`).

### 3.8. Profil Pengguna & Pengaturan Akun (Frame `profil` & `iPhone 16 Pro - 16`)
* **Tujuan**: Mengelola informasi personal pengguna (*Yusuf Affandi*).
* **Fitur Lengkap Sesuai Figma**:
  * Tampilan foto profil dan tombol *"Ubah Foto"*.
  * Field Data Pribadi:
    * *"Nama"*
    * *"Bio"*
    * *"Jenis Kelamin"*
    * *"Tanggal Lahir"*
    * *"No.Handphone"*
    * *"Email"*
  * Form *"Ubah Kata Sandi"*:
    * *"Masukkan sandi lama"*
    * *"Masukkan sandi baru"*
    * *"Ulangi sandi baru"*
  * Tombol aksi: *"Simpan"* dan tombol Logout (*"Keluar"*).

### 3.9. Layar Chat / Bantuan (Frame `iPhone 16 Pro - 14`)
* **Tujuan**: Komunikasi bantuan/pesan terkait pesanan.
* **Fitur**:
  * Riwayat percakapan.
  * Input bar di bagian bawah dengan placeholder: *"Kirim Pesan...."*.

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
