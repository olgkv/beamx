class AppointmentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.confirmation_email.subject
  #
  def confirmation_email(appointment)
    @appointment = appointment
    @service = @appointment.service_provider.name
    @email = @appointment.user.email

    mail to: @email
  end
end
