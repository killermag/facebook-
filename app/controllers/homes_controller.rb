class HomesController < ApplicationController
  layout 'home'
  before_action :authenticate_user! 

  def index 
    ActionCable.server.broadcast('notifications', {user: current_user})
    @posts = Post.all 
  end 
end 

