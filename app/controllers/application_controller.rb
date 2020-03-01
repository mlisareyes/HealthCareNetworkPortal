class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :nested_user, :patient_appt #to be accessible in the views

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

  def nested_user
    params[:user_id]
  end

  def patient_appt
    params[:patient_id]
  end
end
