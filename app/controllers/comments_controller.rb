class CommentsController < ApplicationController
  def create 
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build comment_params
    if @comment.save 
      flash[:success] = 'Comment created.'
      if params[:comment][:redirect]
        redirect_to current_user_path
      else 
        redirect_to homes_path
      end 
    else 
      flash.now[:error] = 'Unable to process comment.'
      render homes_path
    end 
  end 


  def destroy 
    @comment = Comment.find params[:id]
    if @comment.destroy! 
      flash[:success] = "Comment deleted."
      if params[:comment][:redirect]
        redirect_to current_user_path
      else 
        redirect_to homes_path
      end 
    else 
      flash.now[:error] = 'Unable to process comment request.'
      render 'homes/index'
    end 
  end 

  def edit 
    @posts = Post.all.includes :comments, :likes
    if request.query_parameters[:redirect]
      render 'users/me'
    else 
      render 'homes/index'
    end 
  end 

  def update 
    @comment = Comment.find(params[:id])
    @comment.body = params[:comment][:body]
    if @comment.save! 
      flash[:success] = "Comment updated."
    else 
      flash[:error] = "Unable to process comment request."
    end 
    if params[:comment][:redirect]
      redirect_to current_user_path
    else 
      redirect_to homes_path
    end 
  end 

  private
  
  def comment_params 
    params.permit(:post_id).merge(params.require(:comment).permit(:body))
  end 
end
