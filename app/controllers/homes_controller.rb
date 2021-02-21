class HomesController < ApplicationController
  layout 'home'
  before_action :authenticate_user! 

  def index 
    @posts = Post.where("user_id IN (?)", current_user.friends + [current_user]).includes(:comments, :likes)
  end 

end 

