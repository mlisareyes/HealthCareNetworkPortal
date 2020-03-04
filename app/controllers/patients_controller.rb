class PatientsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @patients = @user.patients.alpha.uniq
    else
      @patients = Patient.alpha
    end
     if params[:search]
       @patients = Patient.search(params[:search])
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
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :birthdate, :sex)
  end

  def set_patient
    @patient = Patient.find_by_id(params[:id])
    if !@patient
      redirect_to patients_path
    end
  end
end
