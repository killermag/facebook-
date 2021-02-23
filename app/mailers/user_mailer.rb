class UserMailer < ApplicationMailer
  default from: 'odinairs80@gmail.com'
  
  def after_sign_up_email 
    @user = params[:user]
    @url = 'https://morning-beach-48118.herokuapp.com'
    mail(to: @user.email, subject: 'Thank you for signing up on odin based facebook.')
  end 
end
