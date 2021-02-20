class LikesController < ApplicationController
  def create 
    params = CGI.parse(URI.parse(request.url).query)
    # Check if the post is already liked 
    # Dynamically create like and unlike post links 
    # catch error below. 

    if params["post"][0].to_i
      post = Post.find(params["post"][0]) 
      if post 
        @like = Like.new(user: current_user, post: post)
        if @like.save 
          flash[:success] = "Liked post."
          if request.query_parameters[:redirect]
            redirect_to current_user_path
          else 
            redirect_to homes_path
          end 
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
    params = CGI.parse(URI.parse(request.url).query)

    if params["post"][0].to_i
      @like = Like.find_by(user: current_user, post: Post.find(params["post"][0]))
      @like.destroy!
      flash[:success] = "Unliked post."
      if request.query_parameters[:redirect]
        redirect_to current_user_path
      else 
        redirect_to homes_path
      end 
    else 
      flash.now[:error] = "Unable to process your request."
      render homes_path
    end 
  end 
  
end
