class SinginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "Params before user_params: #{params}"
  
    # Basic validation to check for presence of :user key
    if !params.key?(:user)
      flash[:error] = "Invalid user data submitted."
      return render :new, status: :unprocessable_entity
    end
  
    @user = User.new(user_params)
    if @user.save  
      puts "Saved user attributes: #{@user.attributes}"
      login_url(@user)
      redirect_to home_path, notice: "Successfully registered!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end
end
