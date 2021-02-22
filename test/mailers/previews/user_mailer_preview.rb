# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def after_sign_up_email 
    UserMailer.with(user: User.first).after_sign_up_email 
  end 

end
