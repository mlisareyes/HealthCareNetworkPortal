class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update]

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @appointments = @user.appointments
    else
      @appointments = Appointment.all
    end
    if !params[:date].blank?
      if params[:date] == "Today"
        @appointments = @user.appointments.from_today
      else
        @appointments = @user.appointments.future_appointments
      end
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
    # @appointment = Appointment.find_by_id(params[:id])
  end

  def edit
    # @appointment = Appointment.find_by_id(params[:id])
  end

  def update
    # @appointment = Appointment.find_by_id(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      #error here
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find_by_id(params[:id]).destroy
    redirect_to appointments_path(@user)
    #error if not deleted
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :patient_id)
  end

  def set_appointment
    @appointment = Appointment.find_by_id(params[:id])
    if !@appointment
      flash[:message] = "Appointment was not found"
      redirect_to appointments_path
    end
  end
end
