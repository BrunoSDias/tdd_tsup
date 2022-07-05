class SessionsController < ApplicationController
  skip_before_action :authenticate

  def signin
  end

  def signup
  end

  def signout
    session[:current_user_id] = nil
    redirect_to sessions_signin_path
  end

  def create
    user = User.new(session_params)
    if user.save
      session[:current_user_id] = user.id
      redirect_to home_index_path
      return
    end
    render json: {}, status: :unauthorized
  end

  def login
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:current_user_id] = user.id
      redirect_to home_index_path
      return
    end
    render json: {}, status: :unauthorized
  end

  private

  def session_params
    params.require(:session).permit(:name, :email, :password, :password_confirmation)
  end
end
