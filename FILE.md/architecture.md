# Flutter Project Architecture
**Target**: Struktur Kode Bersih, Terorganisir, dan Ramah Mahasiswa Semester 5  
**Lokasi Project**: `flutter_application_2/lib/`

---

## 1. Filosofi & Pendekatan Arsitektur

Berdasarkan analisis file latihan sebelumnya (`main.dart` dan `tugas_muhammad yusuf affandi_24670009.dart`), kamu sudah memahami widget dasar seperti `Container`, `Column`, `Row`, `Text`, `BoxDecoration`, dan navigasi `Navigator.push`.

Tantangan saat membuat aplikasi besar dari Figma adalah **menghindari menumpuk semua kode dalam 1 file besar** (*spaghetti code*). 

Oleh karena itu, arsitektur yang kita gunakan menganut prinsip **Feature-First / Component-Driven**:
1. **Pemisahan File Berdasarkan Layar (Screen)**: Setiap halaman (Login, Home, Detail, dll.) berada di filenya masing-masing.
2. **Pemisahan Konstanta (Constants)**: Warna dan gaya teks dikumpulkan di satu file agar tidak perlu menulis ulang `Color(0xFF...)` berulang kali.
3. **Komponen Reusable (Reusable Widgets)**: Komponen yang dipakai berulang kali (seperti Tombol Custom, Input Field, Counter) dipisah ke folder `widgets/`.
4. **State Management Sederhana**: Menggunakan `StatefulWidget` bawaan Flutter. Sangat stabil, mudah dipahami alurnya, dan tidak memerlukan package pihak ketiga yang membingungkan saat ditanya dosen.

---

## 2. Struktur Folder & File yang Direkomendasikan

```
flutter_application_2/
├── asset/                          <-- Gambar produk, logo, dan avatar
│   ├── logo.png
│   ├── yusuf.jpeg
│   ├── banner_promo.png
│   ├── rasa_coklat.png
│   ├── rasa_strawberi.png
│   ├── rasa_taro.png
│   ├── rasa_matcha.png
│   └── rasa_tiramisu.png
│
├── lib/
│   ├── main.dart                   <-- Entry point & inisialisasi tema
│   │
│   ├── core/                       <-- Konstanta global
│   │   ├── app_colors.dart         <-- Definisi semua warna Figma
│   │   ├── app_text_styles.dart    <-- Definisi ukuran & ketebalan font
│   │   └── app_theme.dart          <-- ThemeData Material Flutter
│   │
│   ├── models/                     <-- Model data (Struktur Object)
│   │   ├── product_model.dart      <-- Blueprint menu (nama, rasa, harga, gambar)
│   │   ├── topping_model.dart      <-- Blueprint topping (nama, harga, terpilih)
│   │   └── order_model.dart        <-- Blueprint pesanan aktif
│   │
│   ├── data/                       <-- Data tiruan lokal (Dummy Data)
│   │   └── dummy_products.dart     <-- List data produk & varian rasa
│   │
│   ├── screens/                    <-- Halaman-halaman aplikasi
│   │   ├── onboarding/
│   │   │   └── onboarding_screen.dart  <-- Layar "ENJOY YOUR FOOD"
│   │   ├── auth/
│   │   │   ├── login_screen.dart       <-- Layar Login form
│   │   │   └── register_screen.dart    <-- Layar Register
│   │   ├── main_nav_screen.dart        <-- Shell navigasi BottomNavigationBar
│   │   ├── home/
│   │   │   ├── home_screen.dart        <-- Beranda (Banner, Best Seller)
│   │   │   └── widgets/
│   │   │       ├── promo_banner.dart
│   │   │       └── best_seller_item.dart
│   │   ├── menu/
│   │   │   ├── menu_catalog_screen.dart <-- Halaman daftar varian rasa
│   │   │   ├── product_detail_screen.dart<-- Halaman pilih topping & jumlah
│   │   │   └── widgets/
│   │   │       └── topping_selector.dart
│   │   ├── order/
│   │   │   ├── payment_process_dialog.dart <-- Modal loading proses bayar
│   │   │   ├── payment_success_screen.dart <-- Halaman sukses bayar
│   │   │   └── my_order_screen.dart        <-- Halaman riwayat pesanan
│   │   └── profile/
│   │       └── profile_screen.dart         <-- Profil Yusuf Affandi & Setting
│   │
│   └── widgets/                    <-- Komponen umum yang dipakai lintas halaman
│       ├── custom_button.dart      <-- Tombol utama (rounded, gradient)
│       ├── custom_text_field.dart  <-- Input teks seragam
│       └── quantity_counter.dart   <-- Tombol counter jumlah (+/-)
```

---

## 3. Penjelasan Layer & Alur Kerja

### 3.1. Core Layer (`lib/core/`)
Menyimpan variabel yang tidak berubah.
* `app_colors.dart`:
  ```dart
  import 'package:flutter/material.dart';

  class AppColors {
    static const Color primaryGold = Color(0xFFD19025);
    static const Color goldMedium = Color(0xFFD9AC40);
    static const Color scaffoldBg = Color(0xFFFFFDF9);
    static const Color navyButton = Color(0xFF2A5EB0);
    static const Color textDark = Color(0xFF1D1B20);
    static const Color grayInput = Color(0xFFD9D9D9);
  }
  ```
  Dengan cara ini, jika di kemudian hari ingin mengganti warna tema, cukup ubah di satu tempat saja!

### 3.2. Model Layer (`lib/models/`)
Mendefinisikan tipe data agar kode lebih terstruktur dan *type-safe*:
```dart
class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imagePath;
  final String description;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
    required this.description,
  });
}
```

### 3.3. Navigation Layer
Navigasi antar halaman menggunakan `Navigator.push` standar yang sudah kamu pelajari di latihan sebelumnya:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const LoginScreen()),
);
```
Untuk halaman utama, kita menggunakan `MainNavigationScreen` yang mengelola `BottomNavigationBar` dengan `IndexedStack` atau pergantian `currentIndex`, sehingga tab Home, Katalog, Order, dan Profil berpindah dengan sangat responsif.

---

## 4. Keuntungan Arsitektur Ini untuk Tugas Kuliah
1. **Tidak Membingungkan**: Tidak memakai dependency tambahan yang rumit (cukup Flutter bawaan).
2. **Mudah Dipresentasikan**: Sangat jelas saat kamu menjelaskan ke dosen: *"Ini bagian view-nya pak, ini datanya, dan ini komponen tombolnya"*.
3. **Mudah Diuji Coba**: Setiap layar bisa dibuka dan ditest secara independen.
