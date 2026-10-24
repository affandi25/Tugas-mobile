# Implementation Roadmap & Step-by-Step Execution
**Project**: Konversi Desain Figma "Projek" ke Flutter  
**Target Milestone**: Bertahap, Rapi, dan Terarah

---

## Tahap 1: Fondasi & Persiapan Aset (Foundation Setup)
* [x] Buat file konstanta warna di `lib/core/app_colors.dart` dan gaya teks di `lib/core/app_text_styles.dart`.
* [x] Buat model data sederhana (`ProductModel`, `ToppingModel`, `OrderItemModel` di `lib/models/models.dart`).
* [x] Siapkan file `lib/data/dummy_data.dart` berisikan menu varian rasa (Coklat, Strawberi, Taro, Matcha, Tiramisu, Mix Rasa) dan daftar topping.
* [x] Daftarkan aset gambar di `pubspec.yaml` (sudah terdaftar `asset/`).

---

## Tahap 2: Layar Onboarding & Autentikasi (Welcome & Auth)
* [x] **Layar Onboarding (`lib/screens/onboarding_screen.dart`)**:
  * Tampilan grafis bulat, teks tagline *"ENJOY YOUR FOOD"*.
  * Tombol CTA *"GET STARTED"* menuju ke layar Login.
* [x] **Layar Login (`lib/screens/login_screen.dart`)**:
  * Header judul Login.
  * Form field Username/Email dan Password dengan toggle obscure.
  * Tombol *"Submit"* dengan warna Navy (`#2A5EB0`).
  * Pilihan *"Login melalui"* dengan tombol ikon sosial.
  * Navigasi ke halaman Register.
* [x] **Layar Register (`lib/screens/register_screen.dart`)**:
  * Form registrasi akun baru (Nama, Email, Password) dan tombol kembali ke Login.
* [x] Sambungkan `OnboardingScreen` sebagai root `home` di `lib/main.dart`.

---

## Tahap 3: Navigasi Utama & Layar Beranda (Home Dashboard)
* [x] **Shell Navigasi Utama (`lib/screens/main_nav_screen.dart`)**:
  * Implementasi `BottomNavigationBar` dengan 4 tab:
    1. Beranda (Home)
    2. Menu (Katalog Rasa)
    3. Pesanan (My Order)
    4. Profil (Akun)
* [x] **Layar Beranda (`lib/screens/home_screen.dart`)**:
  * Header sapaan: *"Hallo, Yusuf Affandi!"* dengan foto profil dan lonceng notifikasi berbadge.
  * Search bar interaktif.
  * Banner Promo diskon dengan gradien emas khas Figma.
  * Bagian *"BEST SELLER"* dalam tampilan horizontal scrollable card.
* [x] Terhubung langsung dari aksi login di `LoginScreen`.

---

## Tahap 4: Katalog Menu & Kustomisasi Produk (Menu & Detail)
* [x] **Sub-Tahap 4.1: Widget Kartu Katalog Modular (`lib/widgets/catalog_item_card.dart`)**:
  * Visual donat kiri, info rasa & harga kanan, tombol PESAN ungu.
* [x] **Sub-Tahap 4.2: Layar Katalog Varian Rasa (`lib/screens/menu_catalog_screen.dart`)**:
  * Header "Varian Rasa", Search filter live 6 rasa donat, terhubung ke tab Navigasi & "View All".
* [x] **Sub-Tahap 4.3: Widget Modular Interaktif**:
  * **Topping Selector (`lib/widgets/topping_selector.dart`)**: Komponen dropdown "Tambah Toping" (*Oreo, Chocochip, Sprinkle, Kacang almond, Keju*).
  * **Quantity Counter (`lib/widgets/quantity_counter.dart`)**: Komponen counter `-` `1..n` `+` (`Component 2`).
* [x] **Sub-Tahap 4.4: Layar Detail & Konfirmasi Pesanan (`lib/screens/product_detail_screen.dart`)**:
  * Frame `iPhone 16 Plus - 11`: Header "bayar Pesanan", kartu produk, alamat pengiriman ("Delivering to : Alamat rumahmu"), ToppingSelector, QuantityCounter, input "KODE VOUCHER", ringkasan harga dinamis, dan tombol CTA "PESAN".
* [x] **Sub-Tahap 4.5: Integrasi Navigasi Detail**:
  * Kartu & tombol "PESAN" pada Best Seller di Beranda dan Katalog Menu kini membuka `ProductDetailScreen`.

---

## Tahap 5: Alur Pembayaran & Konfirmasi (Checkout & Success)
* [x] **Modal / Loading Transaksi**:
  * Animasi proses dengan teks: *"Pembayaran anda sedang diproses silahkan tunggu....."*.
* [x] **Layar Pembayaran Berhasil (`PaymentSuccessScreen`)**:
  * Icon centang sukses (`tick_svgrepo`).
  * Pesan konfirmasi: *"Pembayaran anda berhasil"*.
  * Tombol untuk kembali ke Beranda atau langsung memantau pesanan di *My Order*.

---

## Tahap 6: Lacak Pesanan, Chat Bantuan & Profil (Orders, Chat & Profile)
* [x] **Layar Pesanan Saya (`MyOrderScreen`)**:
  * Menampilkan daftar pesanan (*Rasa Coklat, Rasa Tiramizu, Rasa Matcha, Rasa Taro*).
  * Badge status pengiriman berwarna hijau cerah: `Order Status : delivery`.
  * Rincian total pembayaran dinamis dan terhubung dengan hasil checkout pesanan.
* [x] **Layar Chat / Bantuan (`ChatScreen` / Sheet)**:
  * Tampilan pesan percakapan pelanggan dengan input bar: *"Kirim Pesan...."*.
* [x] **Layar Profil (`ProfileScreen` & Modal Ubah Sandi)**:
  * Foto profil besar dengan tombol *"Ubah Foto"*.
  * Data identitas pengguna: *Nama*, *Bio*, *Jenis Kelamin*, *Tanggal Lahir*, *No. Handphone*, *Email*.
  * Modal/Form *"Ubah Kata Sandi"*: *Sandi lama*, *Sandi baru*, *Ulangi sandi baru*.
  * Tombol *"Simpan"* dan tombol Logout (*"Keluar"*).

---

## Tahap 7: Uji Coba, Polish, & Persiapan Tugas
* [x] Jalankan pengujian pada emulator / browser untuk memastikan tidak ada *overflow* atau error.
* [x] Struktur kode modular dan clean (0 error, 0 warning pada `flutter analyze`).

---

# FASE 2: Transformasi Sistem Aplikasi Nyata (Living App System & Backend)

## Tahap 8: Sistem Beranda Hidup & Pusat Notifikasi Interaktif (Living Home Dashboard)
* [ ] **8.1. Pusat Notifikasi & Badge Lonceng Reaktif**:
  * Buat model `NotificationModel` (`id`, `title`, `message`, `time`, `isRead`, `type`).
  * Badge lonceng berhitung dinamis berdasarkan `unreadCount` (hilang jika semua terbaca).
  * Modal/Sheet Notifikasi interaktif: menampilkan status pesanan & kupon, tombol *"Tandai Semua Dibaca"*, dan *"Lihat Pesanan"* langsung menuju tab *My Order*.
  * Pemicu otomatis: Pembayaran checkout sukses memicu notifikasi baru *"Pesanan Sedang Diproses!"*.
* [ ] **8.2. Header Pengguna & Sapaan Dinamis**:
  * Hubungkan nama pengguna di header dengan sesi user aktif (*"Hallo, [Nama]!"*).
  * Avatar profil dapat diklik untuk berpindah langsung ke tab Profil.
* [ ] **8.3. Search Bar Interaktif**:
  * Hubungkan `TextField` pencarian dengan `onSubmitted` $\rightarrow$ membuka Katalog Menu dengan filter kata kunci otomatis aktif.
* [ ] **8.4. Banner Promo & Klaim Kupon Interaktif**:
  * Tombol *"Ambil"* pada slider banner menyimpan voucher ke dompet kupon pengguna (`claimedCoupons`).
  * Kupon tersimpan otomatis terpasang saat checkout di layar detail produk.
* [ ] **8.5. Daftar Best Seller (Master Data Lokal)**:
  * Tampilkan 3 produk terfavorit (Tiramizu, Coklat, Matcha) langsung dari `DummyData.products`.
* [ ] **8.6. Menu Pengaturan & Session-Safe Logout**:
  * Tombol keluar pada sheet gear membersihkan token sesi lokal.


## Tahap 9: Sistem Keranjang Belanja Terpadu (Cart System & Multi-Item Checkout)
* [ ] Buat model `CartItemModel` dan `CartService` untuk mengelola keranjang belanja terpusat.
* [ ] **Integrasi Header Katalog (`menu_catalog_screen.dart`)**:
  * Aktifkan ikon keranjang belanja di pojok kanan atas dengan badge angka jumlah item yang dinamis.
  * Dukung `initialSearchQuery` dari Search Bar Beranda ke Katalog.
* [ ] **Fitur Detail Produk & Checkout Dinamis (`product_detail_screen.dart`)**:
  * Dialog ubah alamat pengiriman fleksibel.
  * Pilihan metode pembayaran: E-Wallet (DANA/GoPay), Tunai/COD, dan Transfer Bank.
  * Tombol cepat pasang kupon tersimpan dari promo Beranda.
  * Opsi tombol ganda: *"Tambah ke Keranjang"* vs *"PESAN SEKARANG"*.
* [ ] **Konfirmasi Pembayaran & Terbit Invoice (`payment_success_screen.dart`)**:
  * Penerbitan No. Invoice resmi (`#ORD-YYYYMMDD-XXX`).
  * Pemicu otomatis notifikasi baru ke Lonceng Beranda.
* [ ] Buat Lembar Keranjang Belanja (*Shopping Cart Sheet*):
  * Pengguna bisa mengatur kuantitas (`-` / `+`) atau menghapus donat.
  * Ringkasan total biaya multi-item (misal: 2 Coklat + 1 Matcha).
  * Tombol *"Checkout Semua"* yang langsung memproses seluruh belanjaan dalam satu struk transaksi.



## Tahap 10: Siklus Hidup Status Pesanan Interaktif (Order Lifecycle Tracking)
* [ ] Implementasi 3 status pesanan bertahap:
  1. `Diproses` (Kuning/Oranye - Dapur sedang menyiapkan donat).
  2. `Sedang Diantar (delivery)` (Hijau Terang - Kurir dalam perjalanan).
  3. `Selesai` (Hijau Sukses - Donat telah sampai).
* [ ] Tambahkan tombol aksi interaktif *"Pesanan Diterima"* pada kartu pesanan `delivery` $\rightarrow$ update status jadi `Selesai` & kirim notifikasi selesai ke Lonceng.
* [ ] Lembar Rincian Pesanan / Struk Digital (*Order Detail Sheet*) saat kartu pesanan diklik:
  * Menampilkan No. Invoice resmi (`#ORD-XXXX`).
  * Waktu pemesanan, alamat pengiriman, dan metode pembayaran.
  * Rincian subtotal donat, topping, diskon voucher, total bayar, dan tombol bantuan CS.
* [ ] Aktifkan interaktivitas ikon header My Order:
  * Ikon keranjang belanja membuka *Shopping Cart Sheet*.
  * Ikon gear membuka modal pengaturan akun & logout.
* [ ] Penyimpanan riwayat pesanan permanen ke database MySQL (`orders` & `order_items`) dan memori lokal.


## Tahap 11: Setup Backend Laravel REST API & Database MySQL (Persistence Layer)
* [ ] Setup proyek Laravel API terpisah (`c:\xampp\htdocs\donut-api` atau `donut_api`).
* [ ] Buat database MySQL di XAMPP (`db_donut_app`) beserta migrasi 6 tabel relasional (`users`, `cart_items`, `orders`, `order_items`, `notifications`, `claimed_coupons`).
* [ ] Buat API Controller: Auth (`/api/login`, `/api/register`, `/api/logout`), Notifications, Cart, Orders, dan Profile.
* [ ] Integrasi Flutter `ApiService` dengan konfigurasi IP emulator (`10.0.2.2`).

* [ ] **Sistem Manajemen Sesi & Profil Pengguna**:
  * Simpan Bearer Token & User Profile menggunakan `SharedPreferences`.
  * Hubungkan data profil aktif (nama, email, bio, no. hp, tgl lahir) ke Layar Profil.
  * Fitur **Edit Biodata & Tombol Simpan**: Sinkronisasi perubahan ke MySQL (`PUT /api/profile`) dan otomatis perbarui sapaan Beranda (*"Hallo, [Nama Baru]!"*).
  * Fitur **Ubah Foto Profil**: Pemilihan foto dari perangkat dan update avatar secara instan.
  * Fitur **Ubah Kata Sandi Aman**: Verifikasi kecocokan hash sandi lama di database.
  * Fitur **Auto-Login** (langsung masuk ke Beranda jika sesi aktif) dan **Logout** (bersihkan sesi).
* [ ] *Zero-Crash Fallback*: Jika server Laravel mati, aplikasi otomatis memakai data lokal agar aman saat presentasi.




