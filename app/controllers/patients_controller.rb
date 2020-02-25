class PatientsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @patients = @user.patients + @user.noted_patients
      raise.inspect
    else
      @patients = Patient.all
    end
  end

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @patient = @user.patients.build
    else
      @patient = Patient.new
    end
  end

  def create
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def show
    @patient = Patient.find_by_id(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :birthdate, :gender)
  end
end
