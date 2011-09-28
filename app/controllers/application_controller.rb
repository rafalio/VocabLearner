class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def authorize
    unless current_user
      redirect_to root_url, notice: "Please login"
    end
  end

end
