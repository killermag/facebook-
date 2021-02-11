class CommentsController < ApplicationController
  def create 
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build comment_params
    if @comment.save 
      flash[:success] = 'Comment created.'
      redirect_to homes_path
    else 
      flash.now[:error] = 'Unable to process comment.'
      render homes_path
    end 
  end 


  def destroy 
    @comment = Comment.find params[:id]
    if @comment.destroy! 
      flash[:success] = "Comment deleted."
      redirect_to homes_path 
    else 
      flash.now[:error] = 'Unable to process comment request.'
      render 'homes/index'
    end 
  end 

  def edit 
    @posts = Post.all.includes :comments, :likes
    render 'homes/index'
  end 

  def update 
    @comment = Comment.find(params[:id])
    @comment.body = params[:comment][:body]
    if @comment.save! 
      flash[:success] = "Comment updated."
    else 
      flash[:error] = "Unable to process comment request."
    end 
    redirect_to homes_path
  end 

  private
  
  def comment_params 
    params.permit(:post_id).merge(params.require(:comment).permit(:body))
  end 
end
