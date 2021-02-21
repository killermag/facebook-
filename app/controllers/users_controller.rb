class UsersController < ApplicationController

  def update 
    @user = User.find(params[:id])
    @user.attributes = user_params
    if @user.save validate: false 
      flash[:success] = "Updated user info."
    else 
      flash[:error] = "Unable to process update request."
    end 
    redirect_to current_user_path
  end 


  def me 
    @posts = Post.all.includes :likes, :comments, :image_attachment
  end 

  def cover
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
    @user = User.find(params[:id])
  end 

  private 
  
  def cover_parmas 
    params.require(:user).permit(:cover)
  end 

  def profile_picture_params 
    params.require(:user).permit(:profile_picture)
  end 

  def user_params 
    params.require(:user).permit(:username, :first, :last, :password, :email, :cover, :profile_picture)
  end
end 
