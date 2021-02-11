class User < ApplicationRecord

  include UsersHelper

  attr_accessor :login
  attr_reader :genders 

  has_many :posts 
  has_many_attached :images 
  has_many :requests_sent, class_name: 'Friend', foreign_key: :sender  
  has_many :requests_received, class_name: 'Friend', foreign_key: :receiver 
  has_many :likes 
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments
  has_many :comment_posts, through: :comments, source: :post 

  scope :not_me, ->(me) { where('id <> ?', me.id) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]
  devise :omniauthable, omniauth_providers: %i[facebook]
  
  # VALIDATIONS 

  validates :gender, :first, :last, presence: true 
  validates_format_of :email, with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/

  # Open metaclass and define the following method 
  class << self 
    def find_for_database_authentication warden_condition
      conditions = warden_condition.dup
      login = conditions.delete(:login)
      where(conditions).where(
        ["lower(username) = :value OR lower(email) = :value",
        { value: login.strip.downcase}]).first
    end
  end 

end
