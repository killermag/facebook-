class LikesController < ApplicationController
  def create 
    params = CGI.parse(URI.parse(request.url).query)
    # Check if the post is already liked 
    # Dynamically create like and unlike post links 
    # catch error below. 
    if params["post"].to_i
      post = Post.find(params["post"]) 
      if post 
        @like = Like.new(user: current_user, post: post)
        if @like.save 
          flash[:success] = "Liked post."
          redirect_to homes_path
        else 
          flash.now[:error] = "Unable to process request."
          render "homes/index"
        end 
      else 
      end 
    else 
      flash.now[:error] = 'There was an error processing the URL. Try again'
      render "homes/index"
    end 
  end 

  def destroy 
  end 
  
end
