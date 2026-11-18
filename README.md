# MyPortfolio Mobile (`myportofolio_mobile`)

**Pemrograman Berbasis Platform (CSGE602022) - Gasal 2026/2027**  
**Fakultas Ilmu Komputer, Universitas Indonesia**

* **Nama:** M. Naufal Rizki
* **NPM:** 2506623490
* **Kelas:** PBP B

---

## Deskripsi Proyek

`myportofolio_mobile` adalah aplikasi portofolio pribadi berbasis mobile yang dikembangkan menggunakan framework **Flutter** dan bahasa pemrograman **Dart**. Aplikasi ini merupakan bagian dari ekosistem portofolio pribadi multiplatform yang menghubungkan antarmuka mobile interaktif dengan layanan web portofolio.

---

## Panduan Instalasi dan Menjalankan Proyek

### Prasyarat
- Flutter SDK (versi >= 3.0.0)
- Android Studio / VS Code dengan ekstensi Flutter dan Dart
- Emulator Android / iOS Simulator / Google Chrome (Web)

### Langkah Menjalankan Aplikasi
1. **Clone Repositori:**
   ```bash
   git clone https://github.com/mnaufarizkil07-hash/myportofolio_mobile.git
   cd myportofolio_mobile
   ```

2. **Unduh Dependensi (Packages):**
   ```bash
   flutter pub get
   ```

3. **Verifikasi Analisis Kode (Linting):**
   ```bash
   flutter analyze
   ```

4. **Jalankan Unit & Widget Test:**
   ```bash
   flutter test
   ```

5. **Jalankan Aplikasi:**
   ```bash
   flutter run
   ```

---

## Struktur Direktori Proyek

```text
myportofolio_mobile/
├── lib/
│   ├── main.dart             # Titik masuk aplikasi (root widget & konfigurasi tema MaterialApp)
│   └── menu.dart             # Halaman utama (MyHomePage, InfoCard, ItemCard, dan model ItemHomepage)
├── test/
│   └── widget_test.dart      # Smoke test widget halaman utama
├── pubspec.yaml              # Konfigurasi dependensi dan metadata proyek
└── README.md                 # Dokumentasi proyek, refleksi tugas, dan AI disclosure
```

---

## Dokumentasi Tugas

### Tugas 7

1. **Jelaskan apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-widget!**  
   *Widget tree* (pohon widget) adalah struktur hierarkis deklaratif yang merepresentasikan seluruh elemen visual, struktural, hingga tata letak (*layout*) dari antarmuka pengguna pada aplikasi Flutter. Di Flutter, hampir segala sesuatu adalah widget (*everything is a widget*), mulai dari elemen tata letak seperti `Padding`, `Column`, `Row`, elemen struktural seperti `Scaffold` dan `AppBar`, hingga elemen visual terkecil seperti `Text` dan `Icon`.  
   
   Hubungan induk-anak (*parent-child*) bekerja dengan mekanisme berikut:
   * **Constraint Flows Down**: Widget induk (*parent*) meneruskan batasan ukuran (*constraints* berupa *min/max width* dan *min/max height*) ke bawah kepada widget anaknya (*child*).
   * **Size Flows Up**: Widget anak menentukan ukurannya sendiri berdasarkan batasan yang diberikan oleh induk, lalu mengembalikan ukuran tersebut (*geometry/size*) kembali ke induknya.
   * **Parent Sets Position**: Widget induk bertanggung jawab menempatkan posisi widget anak (*layouting*) di layar koordinatnya (misalnya melalui properti alignment pada `Row`, `Column`, atau `Center`).
   * **Kompilasi Element & Render Tree**: Di balik layar, *widget tree* yang immutable akan diterjemahkan oleh framework Flutter menjadi *Element Tree* (manajemen lifecycle/identitas) dan *RenderObject Tree* (penghitungan geometri dan proses melukis di layar secara aktual).

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**  
   Berikut adalah daftar widget yang digunakan dalam proyek ini beserta fungsinya:
   * **`MaterialApp`**: Root widget aplikasi yang membungkus keseluruhan komponen dengan konfigurasi Material Design, tema aplikasi (`theme`), navigasi, serta konfigurasi lokalisasi.
   * **`Scaffold`**: Widget struktur layout visual dasar Material Design yang menyediakan kerangka halaman, seperti `appBar`, `body`, dan dukungan penempatan `SnackBar`.
   * **`AppBar`**: Menampilkan bilah aplikasi (header) di bagian atas layar untuk menampilkan judul aplikasi (`MyPortfolio`).
   * **`Text`**: Menampilkan teks dengan gaya visual tertentu (font weight, color, alignment, dan ukuran font).
   * **`Padding`**: Memberikan jarak ruang kosong (*padding*) di sekeliling widget anaknya agar tampilan tidak menempel ke tepi layar.
   * **`Column`**: Widget tata letak yang menyusun widget-widget anaknya secara vertikal (atas ke bawah).
   * **`Row`**: Widget tata letak yang menyusun widget-widget anaknya secara horizontal (kiri ke kanan), digunakan untuk menyusun 3 `InfoCard`.
   * **`Center`**: Menempatkan widget anaknya tepat di tengah area yang tersedia.
   * **`SizedBox`**: Memberikan jarak pemisah kosong berdimensi tetap (tinggi/lebar) antar-elemen.
   * **`Card`**: Komponen panel berbentuk kartu dengan sudut membulat dan efek bayangan (*elevation*), digunakan pada `InfoCard`.
   * **`Container`**: Widget serbaguna untuk membungkus elemen dengan dimensi (`width`/`height`), padding, dan styling tertentu.
   * **`GridView.count`**: Menampilkan kumpulan widget anak dalam format kisi (*grid*) dengan jumlah kolom tetap (`crossAxisCount: 3`).
   * **`Material`**: Komponen dasar Material Design yang bertanggung jawab mengatur warna latar kartu tombol dan efek *clipping* radius.
   * **`InkWell`**: Memberikan respons sentuhan interaktif (efek riak/gelombang air atau *splash ripple*) saat kartu ditekan (`onTap`).
   * **`Icon`**: Menampilkan ikon grafis dari pustaka Material Icons (`Icons.folder`, `Icons.add_circle`, `Icons.logout`).
   * **`SnackBar`**: Komponen notifikasi pop-up sementara di bagian bawah layar yang muncul sebagai umpan balik interaktif saat tombol aksi ditekan.

3. **Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai *root widget* pada aplikasi Flutter!**  
   Widget `MaterialApp` berfungsi sebagai pembungkus utama tingkat atas (*top-level wrapper*) yang menginisialisasi ekosistem Material Design pada aplikasi Flutter.  
   
   `MaterialApp` umumnya digunakan sebagai *root widget* karena:
   * **Menyediakan Layanan Inti (*Core Services*)**: Menginisialisasi `Navigator` (sistem navigasi antar-halaman), `ThemeData` (palet warna global, tipografi, dan mode gelap/terang), serta `MediaQuery` (informasi orientasi dan ukuran layar perangkat).
   * **Injeksi `Localizations`**: Menyediakan dukungan internasionalisasi bahasa, teks arah (LTR/RTL), dan format lokal.
   * **Persyaratan Widget Turunan**: Sebagian besar widget bawaan Material Design (seperti `Scaffold`, `AppBar`, `Card`, `SnackBar`, dan `Theme.of(context)`) membutuhkan dependensi `Directionality` dan `MaterialLocalizations` yang secara otomatis disediakan oleh `MaterialApp`. Jika tidak dibungkus `MaterialApp`, widget-widget tersebut akan melempar *runtime error*.

4. **Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?**  

   | Aspek | `StatelessWidget` | `StatefulWidget` |
   | :--- | :--- | :--- |
   | **Karakteristik State** | *Immutable* (tidak berubah sepanjang waktu). Sekali dibuat, properti tidak dapat diubah secara internal. | *Mutable* (dapat berubah secara dinamis selama aplikasi berjalan). |
   | **Struktur Kelas** | Hanya terdiri dari 1 kelas yang meng-override metode `build()`. | Terdiri dari 2 kelas: kelas turunan `StatefulWidget` dan kelas pendamping `State<T>`. |
   | **Trigger Rebuild** | Hanya di-build ulang jika widget induknya meneruskan data/konfigurasi baru ke konstruktornya. | Dapat di-build ulang kapan saja dari dalam dirinya sendiri dengan memanggil `setState()`. |
   | **Penggunaan Memori** | Lebih ringan (*lightweight*) dan efisien. | Sedikit lebih berat karena menyimpan siklus hidup objek `State`. |

   **Kapan Memilih:**
   * **Pilih `StatelessWidget`**: Saat tampilan antarmuka bersifat statis atau hanya bergantung pada konfigurasi data yang di-passing dari widget induk saat inisialisasi (misalnya: halaman tampilan profil, kartu statis, label teks, tombol aksi yang memicu event luar tanpa mengubah tampilan lokal tombol itu sendiri).
   * **Pilih `StatefulWidget`**: Saat tampilan antarmuka perlu bereaksi secara lokal terhadap interaksi pengguna, manipulasi data runtime, animasi internal, input form interaktif (misalnya checkbox, form input teks dengan validasi realtime, timer, atau keranjang belanja dinamis).

5. **Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?**  
   `BuildContext` adalah objek referensi yang merepresentasikan lokasi atau posisi unik suatu widget di dalam *widget tree* (secara internal merujuk ke objek `Element` pada *Element Tree*).  

   **Mengapa Penting:**
   * **Akses ke Inherited Widgets**: Memungkinkan widget anak menelusuri pohon widget ke atas untuk menemukan dan membaca konfigurasi global yang disediakan oleh widget leluhurnya, seperti data tema (`Theme.of(context)`), ukuran layar (`MediaQuery.of(context)`), atau scaffold messenger (`ScaffoldMessenger.of(context)`).
   * **Mengetahui Posisi Geometris**: Memberikan konteks letak render box relatif terhadap jendela layar.

   **Penggunaan di dalam metode `build`:**
   Parameter `BuildContext context` dioperasikan ke metode `build(BuildContext context)` sehingga kita dapat:
   1. Membaca properti tema aplikasi:
      ```dart
      Theme.of(context).colorScheme.primary
      ```
   2. Mengambil dimensi layar perangkat secara responsif:
      ```dart
      double cardWidth = MediaQuery.of(context).size.width / 3.5;
      ```
   3. Menampilkan notifikasi `SnackBar` melalui messenger terdekat:
      ```dart
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(...));
      ```

6. **Jelaskan konsep *hot reload* di Flutter dan apa perbedaannya dengan *hot restart*! Kapan kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan *hot restart* atau *full restart*?**  

   * **Hot Reload**:
     Fitur pengembang Flutter yang menginjeksi berkas kode sumber yang baru diubah ke dalam *Dart Virtual Machine* (Dart VM) yang sedang berjalan secara langsung. Setelah pembaruan kode diterima, Flutter hanya membangun kembali (*rebuild*) *widget tree* yang terpengaruh tanpa mereset status aplikasi saat ini (*preserves app state*). Waktu eksekusi sangat cepat (< 1 detik).
   * **Hot Restart**:
     Menginjeksi kode baru ke Dart VM sekaligus **mereset seluruh *app state*** ke kondisi awal dan mengeksekusi ulang fungsi `main()`.

   **Kapan Kita Tidak Bisa Hanya Mengandalkan Hot Reload:**  
   Hot reload tidak dapat digunakan dan wajib melakukan **Hot Restart** atau **Full Restart / Rebuild** pada skenario berikut:
   1. **Perubahan pada fungsi `main()`** atau inisialisasi awal aplikasi (hot reload tidak menjalankan ulang `main()`).
   2. **Perubahan pada inisialisasi variabel global / static**: Variabel global yang diinisialisasi ulang tidak akan dievaluasi kembali saat hot reload.
   3. **Modifikasi tipe data dari variabel yang sudah ada** (perubahan skema data state).
   4. **Penambahan dependensi baru pada `pubspec.yaml`**: Memerlukan `flutter pub get` dan sering kali memerlukan *full restart* (terutama jika dependensi menyertakan native code).
   5. **Perubahan kode native pada folder `android/`, `ios/`, `macos/`, `windows/`, atau `linux/`**: Memerlukan kompilasi ulang penuh (*full build/run*).
   6. **Perubahan pada kelas `StatefulWidget` menjadi `StatelessWidget`** (atau sebaliknya).

---

## AI Disclosure Statement

Dalam pengerjaan **Individual Assignment 7: Basic Flutter**, asisten kecerdasan buatan (AI) berbasis LLM (**Google Gemini 3.8 Flash via Antigravity**) digunakan sebagai sarana konsultasi teknis, verifikasi arsitektur kode, dan eksplorasi konsep.

### Detail Penggunaan & Strategi Prompting
* **Alat yang Digunakan**: Google Gemini 3.8 Flash (Antigravity Assistant).
* **Strategi Prompting**:
  * Memberikan konteks lengkap spesifikasi tugas Fasilkom UI beserta rubrik penilaian.
  * Meminta penyusunan rencana implementasi langkah demi langkah (*implementation plan*) sebelum penulisan kode.
  * Menguji kepatuhan terhadap standar sintaks Flutter terbaru (penggunaan `const` constructor, Material 3, dan penanganan `ScaffoldMessenger`).
* **Area yang Dibantu AI**:
  1. Brainstorming dan perumusan jawaban komprehensif untuk pertanyaan reflektif Tugas 7.
  2. Pemberian saran pola pewarnaan modular pada `ItemHomepage` dengan menambahkan atribut `final Color color;`.
  3. Struktur smoke test pada `test/widget_test.dart`.

### Analisis Kritis & Perbaikan Manual yang Dilakukan
Meskipun AI memberikan rekomendasi arsitektur yang solid, beberapa verifikasi dan perbaikan manual dilakukan untuk memastikan kesesuaian dengan ketentuan:
1. **Koreksi Data Identitas**: Kode awal pada draf mencantumkan atribut `Program: Sistem Informasi` pada `InfoCard`. Disesuaikan secara manual agar mematuhi instruksi spesifik penugasan yang mewajibkan kartu ketiga berupa `Class` yang memuat kelas PBP aktual (**PBP B**).
2. **Kesesuaian Border Radius pada InkWell**: Rekomendasi awal menaruh radius hanya pada widget `Material`. Ditambahkan `borderRadius: BorderRadius.circular(12)` pada `InkWell` secara manual agar efek *ripple wave* tidak meluber keluar dari sudut membulat kartu.
3. **Verifikasi Linting Mandiri**: Menjalankan perintah `flutter analyze` dan `flutter test` secara langsung di terminal untuk memvalidasi bahwa seluruh kode bebas dari peringatan linter (*No issues found*) dan seluruh pengujian lolos.
