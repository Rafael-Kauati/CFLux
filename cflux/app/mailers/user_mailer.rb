class UserMailer < ApplicationMailer
    default from: 'no-reply@cflux.com' # Set your default sender email
  
    def welcome_email(user)
      @user = user
      @url  = login_url # Adjust to your login URL or path
      mail(to: @user.email, subject: 'Welcome to your personal financy controller')
    end
  end
  