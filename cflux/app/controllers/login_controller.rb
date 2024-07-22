class LoginController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(email: params[:email])
    puts "Found user: #{@user}"

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      puts "User logged in with session ID: #{session[:user_id]}"
      redirect_to home_path, notice: "Successfully logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :index
    end
  end

  def logout
    reset_session
    redirect_to root_path, notice: "Logged out successfully!"
  end

  private

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?
end
