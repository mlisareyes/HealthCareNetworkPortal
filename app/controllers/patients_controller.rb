class PatientsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :birthdate, :gender )
  end
end
