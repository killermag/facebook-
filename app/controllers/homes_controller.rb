class HomesController < ApplicationController
  layout 'home'
  before_action :authenticate_user! 

  def index 
    @posts = Post.all.includes :comments, :likes
  end 

end 

