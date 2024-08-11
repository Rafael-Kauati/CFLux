class SinginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    unless params.key?(:user)
      flash[:error] = "Invalid user data submitted."
      return render :new, status: :unprocessable_entity
    end

    @user = User.new(user_params)

    # Check if the email or name already exists in the database
    if User.exists?(email: @user.email)
      flash.now[:error] = "Email is already taken."
      return render :new, status: :unprocessable_entity
    elsif User.exists?(name: @user.name)
      flash.now[:error] = "Username is already taken."
      return render :new, status: :unprocessable_entity
    end

    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      redirect_to login_path
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?
end