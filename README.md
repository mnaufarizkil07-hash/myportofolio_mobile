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
│   ├── screens/
│   │   ├── menu.dart             # Halaman utama portofolio (MyHomePage & InfoCard)
│   │   ├── project_form.dart     # Formulir Tambah Proyek (Tutorial 09)
│   │   └── experience_form.dart  # Formulir Tambah Pengalaman (Tugas 8)
│   ├── widgets/
│   │   ├── left_drawer.dart      # Menu navigasi samping (Drawer)
│   │   └── project_card.dart     # Widget tombol aksi (ItemCard) & model ItemHomepage
│   └── main.dart                 # Titik masuk utama aplikasi & konfigurasi tema
├── test/
│   └── widget_test.dart          # Smoke test widget halaman utama
├── pubspec.yaml                  # Konfigurasi dependensi dan metadata proyek
└── README.md                     # Dokumentasi proyek, refleksi tugas, dan AI disclosure
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

### Tugas 8

1. **Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**

   * **`Navigator.push()`**: Menambahkan (*push*) sebuah route (halaman) baru ke bagian paling atas tumpukan route (*route stack*) yang dikelola oleh `Navigator`. Route sebelumnya tetap tersimpan di dalam memori/tumpukan di bawahnya. Ketika route teratas ditutup (misalnya melalui tombol *Back* pada gawai atau AppBar), pengguna akan kembali ke route sebelumnya yang berada tepat di bawahnya.
   * **`Navigator.pushReplacement()`**: Menghapus route yang sedang aktif di puncak stack dan langsung menggantikannya dengan route baru. Route lama di atas stack dibuang (*disposed*) sehingga pengguna tidak dapat kembali ke halaman sebelumnya hanya dengan menekan tombol *Back*.
   * **`Navigator.pop()`**: Menghapus (*pop*) route yang sedang aktif di puncak stack, menyebabkan aplikasi kembali menampilkan halaman yang berada tepat di bawahnya pada stack.

   * **Metode untuk Membuka Formulir dari Kartu Aksi**:
     Metode yang digunakan adalah **`Navigator.push()`**. Alasan pemilihannya adalah agar halaman utama (`MyHomePage`) tetap tersimpan di dalam tumpukan navigasi (*route stack*). Dengan demikian, pengguna dapat dengan mudah kembali ke halaman beranda menggunakan tombol navigasi kembali (*back button*) bawaan perangkat Android/iOS maupun tombol *Back* di AppBar.

   * **Bagaimana Opsi Home di Drawer Membawa Pengguna Kembali ke Halaman Utama**:
     Pada widget `LeftDrawer`, navigasi opsi *Home* diimplementasikan menggunakan **`Navigator.pushReplacement()`**:
     ```dart
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(
         builder: (context) => const MyHomePage(),
       ),
     );
     ```
     Ketika pengguna sedang berada di halaman formulir (`ProjectFormPage` atau `ExperienceFormPage`) dan membuka drawer lalu memilih *Home*, `pushReplacement()` akan membuang halaman formulir yang sedang aktif dan menggantikannya dengan `MyHomePage` di puncak stack. Hal ini mencegah penumpukan route secara berulang (*infinite stack build-up*) saat pengguna berpindah-pindah antar-menu drawer, serta menjaga alur kembali (*back stack*) tetap bersih dan tidak membingungkan pengguna saat dijalankan di peramban (Chrome) maupun gawai fisik.

2. **Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**

   * **Menjaga Struktur Halaman Tetap Konsisten**:
     * **`Scaffold`**: Berfungsi sebagai kerangka struktural utama (*scaffolding layout*) Material Design yang menyediakan slot standar untuk elemen-elemen penting seperti `appBar`, `body`, dan `drawer`. Dengan menggunakan `Scaffold` di setiap halaman (`MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage`), seluruh halaman memiliki arsitektur visual dasar yang seragam.
     * **`AppBar`**: Diletakkan pada slot `appBar` milik `Scaffold` untuk menyediakan bilah judul (*header*) yang konsisten di bagian atas layar. Ini memastikan posisi judul halaman, tinggi header, bayangan (*elevation*), serta tombol menu hamburger drawer selalu berada di koordinat yang sama di setiap layar.
     * **`Drawer`**: Diletakkan pada slot `drawer` milik `Scaffold` menggunakan komponen reusable yang sama (`LeftDrawer`). Dengan menanamkan instance `const LeftDrawer()` pada seluruh halaman, pengguna mendapatkan menu navigasi samping yang identik (daftar menu, header informasi aplikasi, dan tata letak) di mana pun mereka berada di dalam aplikasi.

   * **Contoh Penggunaan Warna Tema Portofolio di Lebih dari Satu Halaman**:
     Warna primer portofolio yaitu `Colors.indigo` (dan biru gelap `Color(0xFF122D70)` yang dikonfigurasi pada `ThemeData.colorScheme.primary` di `main.dart`) digunakan secara konsisten di berbagai halaman:
     1. Sebagai latar belakang `AppBar` di halaman utama (`menu.dart`), halaman tambah proyek (`project_form.dart`), dan halaman tambah pengalaman (`experience_form.dart`).
     2. Sebagai latar belakang `DrawerHeader` pada `lib/widgets/left_drawer.dart`.
     3. Sebagai warna tombol utama (*Save Button*) `ElevatedButton` di formulir proyek maupun formulir pengalaman.
     4. Warna kontras teks dan ikon di seluruh AppBar dan DrawerHeader secara konsisten menggunakan warna putih (`Colors.white`).

3. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**

   * **Alasan Pemilihan Tata Letak Formulir**:
     Tata letak vertikal menggunakan `Column` di dalam `Form` dipilih karena secara kognitif mencerminkan alur pengisian data alami manusia (dari atas ke bawah): dimulai dari identitas utama (posisi & perusahaan), kategori/tipe, pemilihan tanggal, deskripsi detail, hingga tombol aksi simpan di bagian paling bawah. Penempatan ini memudahkan pengguna memindai (*scan*) kelengkapan data secara runtut.

   * **Peran Widget Pengatur Jarak (`Padding` dan `SizedBox`)**:
     * Memberikan ruang pemisah yang ergonomis di sekeliling field input (`Padding(padding: EdgeInsets.all(8.0))`), sehingga antar-kolom teks tidak saling menempel rapat.
     * Mencegah kesalahan pengetukan atau salah sentuh (*misclicks*) saat pengguna berinteraksi dengan field input atau tombol aksi pada layar sentuh.
     * Memisahkan elemen tombol simpan dari konten formulir menggunakan `Align` dan `Padding` agar hierarki visual tampak rapi.

   * **Peran Widget Penggulir (`SingleChildScrollView`)**:
     * Ketika ruang layar perangkat terbatas (misalnya pada gawai berukuran layar kecil atau saat orientasi layar berganti ke *landscape*), konten form vertikal dapat melebihi tinggi layar fisik.
     * Lebih kritis lagi, ketika pengguna mengetik pada salah satu field, papan ketik virtual (*soft keyboard*) akan muncul dari bawah layar dan menyita 40%–50% area tampilan (*viewport*). Tanpa widget penggulir, Flutter akan mengalami galat fatal *RenderFlex overflowed by X pixels* (garis belang kuning-hitam) dan tombol *Save* tidak dapat ditekan.
     * `SingleChildScrollView` mengubah seluruh body formulir menjadi area yang dapat digulir (*scrollable viewport*), memungkinkan pengguna menggeser layar ke atas dan ke bawah untuk melihat field yang tertutup papan ketik serta menjangkau tombol Simpan dengan leluasa.

4. **Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**

   * **Peran Elemen Validasi Form:**
     * **`GlobalKey<FormState>`**: Berperan sebagai kunci unik global yang mempertahankan referensi langsung ke status (*state*) dari widget `Form`. Kunci ini memungkinkan kita mengakses metode internal `FormState` (seperti `validate()` dan `reset()`) dari luar pohon form itu sendiri (misalnya dari dalam callback `onPressed` milik tombol `ElevatedButton`).
     * **`validator`**: Fungsi logika verifikasi yang disematkan pada setiap `TextFormField`. Fungsi ini menerima parameter nilai input pengguna saat ini (`String? value`) dan mengembalikan pesan kesalahan berupa `String` jika nilai tidak memenuhi kriteria, atau `null` jika nilai dinyatakan valid.
     * **`validate()`**: Metode pada `FormState` yang dipanggil melalui `_formKey.currentState!.validate()`. Saat tombol Simpan ditekan, metode ini secara rekursif memanggil seluruh fungsi `validator` pada setiap field anak di dalam `Form`. Jika ditemukan minimal satu field yang tidak valid, pesan error akan langsung digambar di bawah field bersangkutan dan fungsi mengembalikan `false`. Jika seluruh field lolos validasi, fungsi mengembalikan `true`.

   * **Contoh Nilai yang Ditolak oleh Validasi**:
     Input berupa string kosong `""` atau hanya berisi spasi `"   "` pada kolom *Posisi / Jabatan*, *Nama Perusahaan*, atau *Deskripsi Pengalaman*. Fungsi validator menolaknya melalui kondisi:
     ```dart
     if (value == null || value.trim().isEmpty) {
       return "Posisi tidak boleh kosong!";
     }
     ```

   * **Mengapa Memilih Jenis Input atau Papan Ketik Saja Belum Cukup**:
     Pengaturan jenis input atau konfigurasi papan ketik (misalnya menggunakan `TextInputType.emailAddress`, `TextInputType.number`, atau `readOnly: true`) pada dasarnya hanyalah **petunjuk antarmuka pengguna (*UI hint*)** bagi sistem operasi untuk menampilkan susunan keyboard yang lebih nyaman. Namun, jenis papan ketik **tidak memiliki kapabilitas penegakan aturan data (*data constraint enforcement*)**:
     1. Pengguna tetap dapat mengosongkan kolom (*empty submission*).
     2. Pengguna dapat menempelkan (*paste*) teks dengan karakter sembarang dari clipboard.
     3. Jenis papan ketik tidak dapat memverifikasi aturan logika bisnis, seperti batasan panjang karakter minimal, format sintaks URL/email yang sah, atau keharusan memilih tanggal.
     Oleh karena itu, fungsi logika `validator` yang dievaluasi melalui `validate()` mutlak diperlukan untuk menjamin validitas, integritas, dan keamanan data aplikasi.

---

## AI Disclosure Statement

Dalam pengerjaan **Individual Assignment 7** dan **Individual Assignment 8**, asisten kecerdasan buatan (AI) berbasis LLM (**Google Gemini 3.8 Flash via Antigravity**) digunakan sebagai sarana konsultasi teknis, perancangan rencana implementasi (*implementation plan*), verifikasi arsitektur kode, dan eksplorasi konsep.

### Detail Penggunaan & Strategi Prompting
* **Alat yang Digunakan**: Google Gemini 3.8 Flash (Antigravity Assistant).
* **Strategi Prompting**:
  * Memberikan konteks lengkap spesifikasi modul penugasan Fasilkom UI beserta kriteria rubrik penilaian.
  * Meminta penyusunan rencana implementasi bertahap (*3 commit stages*) sebelum eksekusi kode dilakukan.
  * Memastikan kepatuhan terhadap standar navigasi Flutter, manajemen state form, pemisahan modular `screens/` dan `widgets/`, serta penanganan null-safety secara ketat.
* **Area yang Dibantu AI**:
  1. Perumusan rencana kerja implementasi terstruktur untuk Tutorial 09 dan Tugas 8.
  2. Implementasi formulir `ExperienceFormPage` dengan integrasi `showDatePicker()` dan validasi form menyeluruh.
  3. Pembentukan arsitektur navigasi drawer terpadu dan penataan kartu aksi di halaman beranda.
  4. Penyusunan draf jawaban reflektif mendalam berbasis teori pemrograman mobile Flutter.

### Analisis Kritis & Perbaikan Manual yang Dilakukan
Meskipun AI memberikan rekomendasi kode dan arsitektur yang solid, berbagai verifikasi dan perbaikan manual dilakukan secara cermat:
1. **Penanganan Controller Lifecycle pada DatePicker**: Penambahan metode `dispose()` secara manual untuk `TextEditingController` pada `ExperienceFormPage` guna mencegah terjadinya kebocoran memori (*memory leak*).
2. **Kesesuaian Import dan Navigasi Modular**: Memastikan seluruh impor menggunakan jalur package absolut yang benar (`package:myportofolio_mobile/screens/...` dan `package:myportofolio_mobile/widgets/...`) serta memastikan tidak ada impor sirkular.
3. **Pembersihan Komentar & Linter**: Memverifikasi secara mandiri bahwa tidak ada komentar `// TODO` yang tertinggal dan kode mematuhi konvensi linting Flutter terkini (`use_build_context_synchronously` dan null-safety).
