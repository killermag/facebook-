class HomesController < ApplicationController
  layout 'home'
  before_action :authenticate_user! 

  def index 
    @posts = Post.where(user: current_user.friends).includes(:comments,:likes)
  end 

end 

