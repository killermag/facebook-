class User < ApplicationRecord

  include UsersHelper

  attr_accessor :login
  attr_reader :genders 

  after_create :send_mail

  has_many :posts, dependent: :destroy  
  has_one_attached :cover, dependent: :destroy  
  has_one_attached :profile_picture, dependent: :destroy 
  has_many_attached :images 
  has_many :requests_sent, class_name: 'Friend', foreign_key: :sender, dependent: :destroy 
  has_many :requests_received, class_name: 'Friend', foreign_key: :receiver, dependent: :destroy 
  has_many :likes, dependent: :destroy  
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy 
  has_many :comment_posts, through: :comments, source: :post 

  scope :not_me, ->(me) { where('id <> ?', me.id) }



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]
  devise :omniauthable, omniauth_providers: %i[facebook]

  
  # VALIDATIONS 

  validates :gender, :first, :last, presence: true, unless: :updating? 
  validates_format_of :email, with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/, unless: :blank? 

  def send_mail 
    UserMailer.with(user: self).after_sign_up_email.deliver_now
  end 

  def blank? 
    email == '' ? true : false 
  end 

  def updating? 
    self.persisted? ? true : false 
  end 

  def friends 
    requests_received.where(accepted: true).pluck(:sender_id) + requests_sent.where(accepted: true).pluck(:receiver_id) + [self.id]
  end 

  def my_friends 
    array = []
    received = requests_received.where(accepted: true).includes(:sender)
    sent = requests_sent.where(accepted: true).includes(:receiver)
    sent.each do |req| 
      array << req.receiver
    end 
    received.each do |req| 
      array << req.sender
    end 
    array
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
