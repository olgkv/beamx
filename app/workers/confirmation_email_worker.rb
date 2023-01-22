class ConfirmationEmailWorker
  include Sidekiq::Worker

  def perform(appointment_id)
    appointment = Appointment.find(appointment_id)
    AppointmentMailer.confirmation_email(appointment).deliver_now
  end
end
