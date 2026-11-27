/**
 * Repository menjadi abstraksi akses data reservasi.
 */
class ReservationRepository {
  constructor(database) {
    this.database = database;
  }

  async checkConflict(ruanganId, mulai, selesai) {
    const sql = `
      SELECT 1
      FROM reservasi
      WHERE ruangan_id = ?
        AND status IN ('PENDING', 'APPROVED')
        AND mulai < ?
        AND selesai > ?
      LIMIT 1`;
    const rows = await this.database.query(sql, [ruanganId, selesai, mulai]);
    return rows.length > 0;
  }

  async save(reservasi) {
    // Stub implementasi awal: repository akan menghasilkan ID dan menyimpan transaksi.
    return { ...reservasi, reservasiId: "R-" + Date.now() };
  }
}

module.exports = { ReservationRepository };
