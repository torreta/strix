class UserMailer < ApplicationMailer
    
    default from:"torreta.sendgrid.net"
    
  def send_signup_email (user)
  	@user = user
  	mail(to: @user.email, subject: "Thanks for signing up to our service")
  end
  	
end
