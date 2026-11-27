# CampusBook

CampusBook adalah implementasi awal untuk reservasi ruang dan peralatan kampus.

## Struktur
- `src/controllers` — lapisan penerima permintaan HTTP
- `src/services` — aturan bisnis, validasi, dan cek bentrok
- `src/repositories` — akses skema dan data
- `database` — migrasi dan skrip skema MySQL
- `docs` — dokumentasi desain

## Setup
1. Buat database MySQL.
2. Jalankan `database/schema.sql`.
3. Konfigurasi environment untuk koneksi database dan layanan email.

## Alur reservasi
Peminjam mengirim reservasi, `ReservationService` memvalidasi dan mengecek bentrok,
kemudian `ReservationRepository` menyimpan reservasi sebagai `PENDING`.
