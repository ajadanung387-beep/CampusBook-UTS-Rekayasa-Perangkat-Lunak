/**
 * Service berisi aturan bisnis dan deteksi bentrok reservasi.
 */
class ReservationService {
  constructor(reservationRepository) {
    this.reservationRepository = reservationRepository;
  }

  async createReservation(data) {
    if (!data.ruanganId || !data.peminjamId || !data.mulai || !data.selesai) {
      throw new Error("Data reservasi tidak lengkap.");
    }
    if (new Date(data.mulai) >= new Date(data.selesai)) {
      throw new Error("Waktu selesai harus setelah waktu mulai.");
    }

    const bentrok = await this.reservationRepository.checkConflict(
      data.ruanganId,
      data.mulai,
      data.selesai,
    );
    if (bentrok) {
      return { status: "REJECTED", reason: "Jadwal ruangan bentrok." };
    }

    return this.reservationRepository.save({ ...data, status: "PENDING" });
  }
}

module.exports = { ReservationService };
