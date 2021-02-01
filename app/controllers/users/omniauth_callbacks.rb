class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	skip_before_action :verify_authenticity_token, only: :facebook 

	def facebook 
    user = User.from_omniauth(request.env["omniauth.auth"])
    
    redirect_to homes_path 
  end 

  def failure 
    redirect_to root_path
  end 
  
end