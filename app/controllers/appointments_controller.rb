class AppointmentsController < ApplicationController

  def index
    if params[:patient_id] && @patient = Patient.find_by_id(params[:patient_id])
      @appointments = @patient.appointments
    else
      @appointments = Appointment.all
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def show
    
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :patient_id)
  end
end
