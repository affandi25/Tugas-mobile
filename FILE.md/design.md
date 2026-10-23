# Design Guidelines & Visual Tokens
**Project**: Aplikasi Mobile Pemesanan Dessert & Minuman  
**Extracted from**: Figma File *"Projek"* (Page 2 / Node `10:39`)  
**Target Device**: iPhone 16 Pro ($402 \times 874 \text{ dp}$)

---

## 1. Color Palette (Palet Warna)

Berikut adalah token warna yang diekstrak langsung dari desain Figma dan kode `Color` Flutter-nya:

### 1.1. Brand / Primary Colors (Aksen Emas & Hangat)
| Nama Token | Hex Code | Flutter Code | Penggunaan |
| :--- | :--- | :--- | :--- |
| **Primary Gold** | `#D19025` | `const Color(0xFFD19025)` | Warna aksen utama, tombol, icon active |
| **Gold Medium** | `#D9AC40` | `const Color(0xFFD9AC40)` | Gradien banner, aksen sekunder |
| **Gold Light** | `#F5E77E` | `const Color(0xFFF5E77E)` | Gradien highlight |
| **Yellow Accent** | `#F0C24D` | `const Color(0xFFF0C24D)` | Badge, notifikasi, rating |

### 1.2. Backgrounds & Surfaces (Netral Hangat)
| Nama Token | Hex Code | Flutter Code | Penggunaan |
| :--- | :--- | :--- | :--- |
| **Scaffold Cream** | `#FFFDF9` | `const Color(0xFFFFFDF9)` | Background utama halaman Home & Detail |
| **Pure White** | `#FFFFFF` | `const Color(0xFFFFFFFF)` | Background kartu, modal dialog |
| **Surface Alt** | `#FFFEFB` | `const Color(0xFFFFFEFB)` | Background sekunder |
| **Card Low** | `#F7F2FA` | `const Color(0xFFF7F2FA)` | Background tombol/input lembut |
| **Gray Input** | `#D9D9D9` | `const Color(0xFFD9D9D9)` | Background input field & placeholder |

### 1.3. Secondary & Functional Colors
| Nama Token | Hex Code | Flutter Code | Penggunaan |
| :--- | :--- | :--- | :--- |
| **Navy / Indigo** | `#2A5EB0` | `const Color(0xFF2A5EB0)` | Tombol Submit pada Login/Auth |
| **Soft Purple** | `#8968F6` | `const Color(0xFF8968F6)` | Tombol pesan alternatif & aksen modern |
| **Success Green**| `#2ED542` | `const Color(0xFF2ED542)` | Status pesanan sukses / badge delivery |
| **Text Primary**  | `#1D1B20` | `const Color(0xFF1D1B20)` | Teks judul utama & label tebal |
| **Text Secondary**| `#49454F` | `const Color(0xFF49454F)` | Deskripsi, subtitle, caption |

### 1.4. Gradients (Gradien)
* **Gold Banner Gradient**:
  ```dart
  const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFD19025),
      Color(0xFFD9AC40),
      Color(0xFFF5E77E),
    ],
  );
  ```

---

## 2. Typography (Tipografi)

Di Figma digunakan kombinasi font modern (*Inter*, *SF Pro*, dan *SeoulNamsan*). Di Flutter, kita dapat memetakannya ke `TextStyle` standar atau font `GoogleFonts.inter` dengan hierarki berikut:

| Level | Size | Weight | Line Height | Contoh Penggunaan |
| :--- | :--- | :--- | :--- | :--- |
| **Display / Title** | `32.0` | `FontWeight.bold` (700) | `1.2` | Judul "ENJOY YOUR FOOD", "Login" |
| **Headline** | `24.0` | `FontWeight.w600` (600) | `1.3` | Judul Varian Rasa, Judul My Order |
| **Subhead** | `18.0` | `FontWeight.w600` (600) | `1.4` | Nama produk, Best Seller item |
| **Body Large** | `16.0` | `FontWeight.normal` (400) | `1.5` | Sapaan "Hallo, Yusuf Affandi!", Form text |
| **Body Medium** | `14.0` | `FontWeight.w500` (500) | `1.4` | Deskripsi menu, tombol aksi |
| **Caption / Small** | `12.0` | `FontWeight.w400` (400) | `1.3` | Badge status delivery, hint text |

---

## 3. Border Radii (Sudut Melengkung)
Desain Figma memiliki ciri khas sudut yang sangat membulat (*organic & friendly*):
* **Screen Container / Frame**: `BorderRadius.circular(34.0)`
* **Card / Container**: `BorderRadius.circular(16.0)` hingga `20.0`
* **Input Field**: `BorderRadius.circular(10.0)`
* **Pill Buttons (Tombol Lonjong)**: `BorderRadius.circular(24.0)`
* **Avatar & Circle Button**: `BorderRadius.circular(999.0)` / `CircleAvatar`

---

## 4. Shadows (Efek Bayangan)
Untuk memberikan kesan kedalaman (*depth*):
```dart
// Bayangan kartu dan tombol utama
const BoxShadow softCardShadow = BoxShadow(
  color: Color(0x20000000), // hitam opacity 12%
  blurRadius: 10,
  offset: Offset(0, 4),
);

// Bayangan tombol CTA
const BoxShadow buttonShadow = BoxShadow(
  color: Color(0x302A5EB0),
  blurRadius: 8,
  offset: Offset(0, 3),
);
```

---

## 5. Spesifikasi Komponen Kunci (Key Components)

### 5.1. Input Field (Search & Form)
* Tinggi: $48 \text{ dp}$
* Background: Warna abu-abu lembut (`Color(0xFFD9D9D9)` atau `Color(0xFFF7F2FA)`)
* Border: Tanpa garis tepi tebal (*borderless*) atau border tipis transparan
* Sudut: `BorderRadius.circular(10.0)`
* Padding dalam: Horizontal $16 \text{ dp}$

### 5.2. Topping Selector (Filter Chips)
* Bentuk: Kotak bulat dengan border tipis
* Status Tidak Aktif: Background putih, border abu-abu
* Status Aktif (Dipilih): Background emas lembut (`Color(0xFFF0C24D)`), border emas pekat, teks tebal dengan ikon centang

### 5.3. Quantity Counter
* Komposisi: Row horizontal yang terdiri dari:
  * Tombol Bulat minus (`-`)
  * Teks angka jumlah (1, 2, 3...)
  * Tombol Bulat plus (`+`)
* Warna: Abu-abu gelap dengan teks putih atau warna emas

### 5.4. Bottom Navigation Bar
* Tinggi: $64 \text{ dp}$
* Posisi: Fixed di bagian bawah Scaffold
* Ikon: Home (Beranda), Menu (Katalog), Order (Pesanan), Profil (Akun)
* Indikator aktif: Aksen warna emas (`Color(0xFFD19025)`)
