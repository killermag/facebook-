class UsersController < ApplicationController
  def me 
    @posts = Post.all.includes :likes, :comments, :image_attachment
  end 

  def cover
    byebug
    current_user.cover.attach params[:user][:cover]
    current_user.save!(validate: false)
    redirect_to current_user_path
  end 

  def profile_picture 
    current_user.profile_picture.attach params[:user][:profile_picture]
    current_user.save!(validate: false)
    redirect_to current_user_path
  end 

  def show 
    current_user = User.find(params[:id])
    render :show, locals: { current_user: current_user }
  end 

  private 
  
  def cover_parmas 
    params.require(:user).permit(:cover)
  end 

  def profile_picture_params 
    params.require(:user).permit(:profile_picture)
  end 
end 
