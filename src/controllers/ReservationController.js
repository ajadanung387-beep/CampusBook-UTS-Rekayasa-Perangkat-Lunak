/**
 * Controller lapisan presentation untuk permintaan reservasi.
 */
class ReservationController {
  constructor(reservationService) {
    this.reservationService = reservationService;
  }

  async createReservation(request) {
    const { ruanganId, peminjamId, mulai, selesai, alat } = request.body;
    return this.reservationService.createReservation({
      ruanganId,
      peminjamId,
      mulai,
      selesai,
      alat: alat ?? [],
    });
  }
}

module.exports = { ReservationController };
