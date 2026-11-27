# CampusBook

Proyek tugas Rekayasa Perangkat Lunak: rancangan dan implementasi awal sistem
reservasi ruang serta peralatan kampus.

## Dokumen tugas
- [Jawaban lengkap (PDF)](docs/Jawaban_UTS_CampusBook.pdf)
- [Versi DOCX](docs/Jawaban_UTS_CampusBook.docx)
- [SRS mini](docs/SRS-mini.md)

## Struktur
- `src/controllers` — lapisan penerima permintaan HTTP
- `src/services` — aturan bisnis, validasi, dan cek bentrok
- `src/repositories` — akses skema dan data
- `database` — migrasi dan skrip skema MySQL
- `docs` — dokumentasi desain

## Setup
1. Buat database MySQL.
2. Jalankan `database/schema.sql`.
3. Konfigurasikan koneksi database dan layanan email.

Catatan: repository ini berisi rancangan dan kerangka implementasi awal; antarmuka
web belum dibangun.

## Alur reservasi
Peminjam mengirim reservasi, `ReservationService` memvalidasi dan mengecek bentrok,
kemudian `ReservationRepository` menyimpan reservasi sebagai `PENDING`.
