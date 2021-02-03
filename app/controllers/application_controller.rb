class ApplicationController < ActionController::Base
  layout 'register'
  before_action :set_username_from_first_and_last, if: :making_a_new_user 
  before_action :permit_params, if: :devise_controller?


  private 

  def after_sign_up_path_for(resource)
  	new_user_sessions_path
  end 

  def after_sign_in_path_for(resource)
 	  homes_path
  end

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end

  def making_a_new_user 
    return true if controller_name = 'devise/registrations' && action_name == 'create'
    return false 
  end 

  def set_username_from_first_and_last
    if params[:user]
    params[:user][:username] = "#{params[:user][:first]}#{params[:user][:last]}"
    # params[:user].delete(:first)
    # params[:user].delete(:last)
    end 
  end 


  def permit_params 
    devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:first, :last, :username, :password,:email, :gender, "birthday(3i)","birthday(2i)","birthday(1i)" ) }
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
  end 
end
