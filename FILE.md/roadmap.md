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
* [ ] **Layar Pesanan Saya (`MyOrderScreen`)**:
  * Menampilkan daftar pesanan (*Rasa Taro, Rasa Coklat, Rasa Tiramizu, Rasa Matcha*).
  * Badge status pengiriman berwarna hijau cerah: `Order Status : delivery`.
  * Rincian total pembayaran (misal: `Total : Rp 26.000`).
* [ ] **Layar Chat / Bantuan (`ChatScreen`)**:
  * Tampilan pesan pelanggan dengan input bar: *"Kirim Pesan...."*.
* [ ] **Layar Profil (`ProfileScreen` & Modal Ubah Sandi)**:
  * Foto profil besar dengan tombol *"Ubah Foto"*.
  * Data identitas pengguna: *Nama*, *Bio*, *Jenis Kelamin*, *Tanggal Lahir*, *No. Handphone*, *Email*.
  * Modal/Form *"Ubah Kata Sandi"*: *Sandi lama*, *Sandi baru*, *Ulangi sandi baru*.
  * Tombol *"Simpan"* dan tombol Logout (*"Keluar"*).

---

## Tahap 7: Uji Coba, Polish, & Persiapan Tugas
* [ ] Jalankan pengujian pada emulator / browser untuk memastikan tidak ada *overflow* atau error.
* [ ] Tambahkan komentar penjelas di baris-baris kode penting agar kamu mudah menjelaskannya saat dinilai oleh dosen.
