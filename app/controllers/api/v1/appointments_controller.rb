class Api::V1::AppointmentsController < ApplicationController
  before_action :authorize_access_request!
  before_action :set_appointment, only: %i[show update destroy]

  def index
    @appointments = Appointment.all

    render json: @appointments
  end

  def show
    render json: @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      ConfirmationEmailWorker.perform_async(@appointment.id)
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    date = convert_to_datetime(params.require(:appointment)[:date])
    params.require(:appointment).permit(:service_provider_id, :user_id, :date).merge(date:)
  end

  def convert_to_datetime(date)
    Time.at(date.to_i).utc if date.present?
  end
end
