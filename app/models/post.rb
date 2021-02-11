class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user 
  has_many :likes 
  has_many :liked_by, through: :likes, source: :user 
  has_many :comments
  has_many :comment_author, through: :comments, source: :user 



  def when 
    if created_at.hour == Time.now.hour && created_at.day == Time.now.day 
      return (60-created_at.min).to_s + 'm'
    elsif Time.now.day == created_at.day
      return (Time.now.hour - created_at.hour ).to_s + 'h'
    else 
      return (Time.now.day - created_at.day).to_s + 'd'
    end 
  end 
end
