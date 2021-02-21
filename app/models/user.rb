class User < ApplicationRecord

  include UsersHelper

  attr_accessor :login
  attr_reader :genders 

  has_many :posts 
  has_one_attached :cover 
  has_one_attached :profile_picture
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

  validates :gender, :first, :last, presence: true, unless: :updating? 
  validates_format_of :email, with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/

  def updating? 
    self.persisted? ? true : false 
  end 

  def friends 
    requests_received.where(accepted: true).pluck(:id) + requests_sent.where(accepted: true).pluck(:id) + [self.id]
  end 

  # Open metaclass and define the following method 
  class << self 
    def find_for_database_authentication warden_condition
      conditions = warden_condition.dup
      login = conditions.delete(:login)
      where(conditions).where(
        ["lower(username) = :value OR lower(email) = :value",
        { value: login.strip.downcase}]).first
    end

    def from_omniauth(auth)
     # name = auth.info.name.split(" ")
     # user = User.where(email: auth.info.email).first 
     # user ||= User.create!(provider: auth.provider, uid: auth.uid, last: name[1], first: name[0], username: name, password: Devise.friendly_token[0,20])
     # user
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user| 
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.username = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid 
        user.first = auth.info.first_name 
        user.last = auth.info.last_name 
        user.save!(validate: false)
      end 
    end 
  end 

end
