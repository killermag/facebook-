class UserMailer < ApplicationMailer
  
  def after_sign_up_email 
    @user = params[:user]
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Thank you for signing up on odin based facebook.')
  end 
end
