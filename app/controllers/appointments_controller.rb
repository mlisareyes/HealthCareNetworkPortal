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
    @appointment = Appointment.find_by_id(params[:id])
  end

  def edit
    @appointment = Appointment.find_by_id(params[:id])
  end

  def update
    @appointment = Appointment.find_by_id(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      #error here
      render :edit
    end
  end

  def destroy
    @appointment= Appointment.find_by_id(params[:id]).destroy
    redirect_to appointments_path(@appointment)
    #error if not deleted
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :patient_id)
  end
end
