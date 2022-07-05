class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :current_user

  def authenticate
    redirect_to sessions_signin_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id])
  end
end
