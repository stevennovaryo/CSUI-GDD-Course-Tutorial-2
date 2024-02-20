# Game Development Course Tutorial

## Latihan: Playtest

1.  Apa saja pesan log yang dicetak pada panel Output?
    Pesan yang akan dicetak adalah "Platform initialized" saat initialisasi.

1.  Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?
    Tercetak pesan "Reached objective!" ketika blueship menyentuh area pojok kiri atas.

1.  Buka scene `MainLevel` dengan tampilan workspace 2D. Apakah lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?
    Objek "ObjectiveArea" memiliki kaitan, dengan kata lain, ketika objek BlueShip menyentuh ObjectiveArea maka akan keluar pesan tersebut.

## Latihan: Memanipulasi Node dan Scene

1.  Scene `BlueShip` dan `StonePlatform` sama-sama memiliki sebuah child node bertipe `Sprite`. Apa fungsi dari node bertipe `Sprite`?
    Node bertipe `Sprite` dibuat dari image atau tekstur dan berfungsi sebagai komponen utama yang memberikan tampilan ke scene dalam game dua dimensi. 

1.  Root node dari scene `BlueShip` dan `StonePlatform` menggunakan tipe yang berbeda. `BlueShip` menggunakan tipe `RigidBody2D`, sedangkan `StonePlatform` menggunakan tipe `StaticBody2D`. Apa perbedaan dari masing-masing tipe node?
    Perbedaan utama dalam `RigidBody2D` dan `StaticBody2D` adalah pada properti fisiknya. Node `RigidBody2D` memiliki properti seperti massa, bounciness, gesekan, dan lain-lain untuk membantu mengontrol pergerakannya. Oleh karena itu, `RigidBody2D` lebih banyak digunakan untuk objek hidup atau bergerak seperti player, enemies, atau projektil. Sementara `StaticBody2D` lebih banyak digunakan untuk objek statis seperti platform, dinding, atau ceiling.  

1. Ubah nilai atribut `Mass` dan `Weight` pada tipe `RigidBody2D` secara bebas di scene `BlueShip`, lalu coba jalankan scene `MainLevel`. Apa yang terjadi?


1. Ubah nilai atribut `Disabled` pada tipe `CollisionShape2D` di scene `StonePlatform`, lalu coba jalankan scene `MainLevel`. Apa yang terjadi?
    Objek `Blueship` akan langsung jatuh tanpa memperhatikan `StonePlatform`. Hal ini dikarenakan `BlueShip` yang terkait dengan gravitasi akan terus bergerak ke bawah dengan tidak adanya objek yang menghalangi.

1. Pada scene `MainLevel`, coba manipulasi atribut `Position`, `Rotation`, dan `Scale` milik node `BlueShip` secara bebas. Apa yang terjadi pada visualisasi `BlueShip` di `Viewport`?
    Node `BlueShip` akan berpindah posisi apabila diganti `Position`, berotasi apabila diganti `Rotation`, atau berubah skala-nya apabila diganti `Scale`-nya. Ketiga konsep tersebut sama dengan konsep transformasi geometri.

1. Pada scene `MainLevel`, perhatikan nilai atribut `Position` node `PlatformBlue`, `StonePlatform`, dan `StonePlatform2`. Mengapa nilai Position node `StonePlatform` dan `StonePlatform2` tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?
    Posisi x dan y di inspector untuk `StonePlatform` dan `StonePlatform2` merupakan posisi relatif terhadap titik tengah node `PlatformBlue`. Sementara position `PlatformBlue` dan `BlueShip` merupakan posisinya secara global.

## Latihan Mandiri: Membuat Level Baru

Pada level baru ini, diharapkan kamu dapat membuat:
- Objek pesawat baru.
- Objek landasan baru.
- Desain level yang berbeda dari level awal dengan menempatkan ObjectiveArea di pojok kanan atas atau pojok kana bawah area permainan di level baru.
- Silakan berkreasi jika ingin memoles level awal maupun level baru. Beberapa ide polishing:
  - Implementasi reset kondisi level ketika pesawatnya jatuh ke luar area permainan.
  - Implementasi transisi level awal ke level baru ketika pemain berhasil mencapai ObjectiveArea. Misalnya menampilkan pesan kemenangan sesaat sebelum pindah level.
  - Menambahkan gambar latar.
  - Menambahkan rintangan objek statis pada level baru.
  - Dan lain-lain. Silakan berkreasi!

```
Saya membuat level baru dengan menambahkan kontrol pesawat dan landasan baru. Level disertai dengan rintangan objek statis dan efek meledak ketika *out of bound* atau menyentuh objek tersebut.
```