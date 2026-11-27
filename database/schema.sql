CREATE TABLE peminjam (
  peminjam_id VARCHAR(36) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  tipe ENUM('MAHASISWA', 'DOSEN') NOT NULL,
  prodi VARCHAR(100)
);

CREATE TABLE ruangan (
  ruangan_id VARCHAR(36) PRIMARY KEY,
  kode VARCHAR(20) NOT NULL UNIQUE,
  nama VARCHAR(100) NOT NULL,
  kapasitas INT NOT NULL CHECK (kapasitas >= 0)
);

CREATE TABLE alat (
  alat_id VARCHAR(36) PRIMARY KEY,
  kode VARCHAR(20) NOT NULL UNIQUE,
  nama VARCHAR(100) NOT NULL,
  stok INT NOT NULL CHECK (stok >= 0)
);

CREATE TABLE reservasi (
  reservasi_id VARCHAR(36) PRIMARY KEY,
  peminjam_id VARCHAR(36) NOT NULL,
  ruangan_id VARCHAR(36) NOT NULL,
  mulai DATETIME NOT NULL,
  selesai DATETIME NOT NULL,
  status ENUM('PENDING', 'APPROVED', 'REJECTED', 'CANCELLED') NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_reservasi_peminjam FOREIGN KEY (peminjam_id) REFERENCES peminjam(peminjam_id),
  CONSTRAINT fk_reservasi_ruangan FOREIGN KEY (ruangan_id) REFERENCES ruangan(ruangan_id),
  CONSTRAINT chk_reservasi_waktu CHECK (mulai < selesai)
);

CREATE TABLE reservasi_alat (
  reservasi_id VARCHAR(36) NOT NULL,
  alat_id VARCHAR(36) NOT NULL,
  jumlah INT NOT NULL,
  PRIMARY KEY (reservasi_id, alat_id),
  CONSTRAINT fk_reservasi_alat_reservasi FOREIGN KEY (reservasi_id) REFERENCES reservasi(reservasi_id),
  CONSTRAINT fk_reservasi_alat_alat FOREIGN KEY (alat_id) REFERENCES alat(alat_id),
  CONSTRAINT chk_jumlah_alat CHECK (jumlah > 0)
);

CREATE TABLE peminjaman (
  peminjaman_id VARCHAR(36) PRIMARY KEY,
  reservasi_id VARCHAR(36) NOT NULL,
  petugas_id VARCHAR(36) NOT NULL,
  waktu_keluar DATETIME,
  waktu_kembali DATETIME,
  kondisi_keluar TEXT,
  kondisi_kembali TEXT,
  CONSTRAINT fk_peminjaman_reservasi FOREIGN KEY (reservasi_id) REFERENCES reservasi(reservasi_id)
);
