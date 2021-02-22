class PostsController < ApplicationController
  layout 'post'

  def new 
    @post = Post.new 
  end 

  def create 
    @post = current_user.posts.build post_params 

    storage = Google::Cloud::Storage.new(
      project_id: "My First Project",
      credentials: "../../keyfile.json"
    )
    bucket = storage.bucket "odin_facebook"
    file = bucket.file "path/to/my-file.ext"
    # Download the file to the local file system
    file.download "/tasks/attachments/#{file.name}"
    # Copy the file to a backup bucket
    backup = storage.bucket "task-attachment-backups"
    file.copy backup, file.name

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
    @post.image = params[:post][:image] unless params[:post][:image].nil? 

    if @post.save 
      if params[:post][:redirect]
        redirect_to current_user_path 
      else 
        redirect_to homes_path, success: 'Edited Post'
      end 
    else
      flash.now[:error] = 'Couldn\'t edit post' 
      render 'edit'
    end 

  end 

  def destroy 
    Post.find(params[:id].to_s).destroy 
    if request.query_parameters[:redirect] 
      redirect_to current_user_path 
    else 
      redirect_to homes_path, success: 'Deleted Post'
    end 
  end 

  private 

  def post_params 
    params.require(:post).permit(:body, :image)
  end 

end
