class User < ApplicationRecord
  attr_accessor :login 

  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]
  devise :omniauthable, omniauth_providers: %i[facebook]

  validates_format_of :email, with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/
  
  def self.from_omni_auth(auth)
  end 

  class << self 

    def find_for_database_authentication warden_condition
      conditions = warden_condition.dup
      login = conditions.delete(:login)
      where(conditions).where(
        ["lower(username) = :value OR lower(email) = :value",
        { value: login.strip.downcase}]).first
    end
  end 



  private 

  

  

end
