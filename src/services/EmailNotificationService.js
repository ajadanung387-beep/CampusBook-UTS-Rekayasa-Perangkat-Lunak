/**
 * Adapter stub untuk integrasi Layanan Email eksternal.
 */
class EmailNotificationService {
  async sendReservationStatus(email, reservasiId, status) {
    // Implementasi provider SMTP/API dilakukan pada iterasi berikutnya.
    return {
      to: email,
      subject: `Status reservasi ${reservasiId}: ${status}`,
      queued: true,
    };
  }
}

module.exports = { EmailNotificationService };
