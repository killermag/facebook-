class HomesController < ApplicationController
  layout 'home'
  before_action :authenticate_user! 

  def index 
    @posts = Post.all 
    NotifChannel.broadcast_to(
      current_user,
      title: 'New things!',
      body: 'All the news fit to print'
    )
  end 
end 

