class PostsController < ApplicationController
  layout 'post'

  def new 
    @post = Post.new 
  end 

  def create 
    @post = current_user.posts.build post_params 

    if @post.save 
      redirect_to homes_path, success: 'Post created'
    else 
      flash.now[:alert] = 'Post couldn\'t be created'
      render :new 
    end 

  end 

  def edit 
    @post = Post.find(params[:id])
  end 

  def update 
    @post = Post.find(params[:id])
    @post.body = params[:post][:body] 
    @post.image = params[:post][:image]

    if @post.save 
      redirect_to homes_path, success: 'Edited Post'
    else
      flash.now[:error] = 'Couldn\'t edit post' 
      render 'edit'
    end 

  end 

  def destroy 
    Post.find(params[:id]).destroy 

    redirect_to homes_path, success: 'Deleted Post'
  end 

  private 

  def post_params 
    params.require(:post).permit(:body, :image)
  end 

end
