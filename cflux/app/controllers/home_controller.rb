class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      puts "Current user : #{@user}"
    end 
  end
end
