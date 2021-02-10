class FriendsController < ApplicationController

  def index 
    # Fetching all friends and friend requests for current user 
    @sent_requests = Friend.where("sender_id = ? AND accepted = ?", current_user.id, false)
    @received_requests = Friend.where(receiver: current_user).where(accepted: false)
    friend_requests = current_user.requests_received.pluck(:sender_id) + current_user.requests_sent.pluck(:receiver_id)
    

    if friend_requests.any? 
      @users = User.not_me(current_user).where('id NOT IN (?)', friend_requests)
    else  
      @users = User.not_me(current_user)
    end 
    
  end 

  def new 
    # Creating a new friend request 
    params = CGI.parse(URI.parse(request.url).query)

    receiver = User.find_by('id = ?', params["receiver"])
    new_friend_request = Friend.new(sender: current_user, receiver: receiver) 
    if new_friend_request.save!
      flash[:success] = 'Friend request sent!'
      NotifChannel.broadcast_to(receiver, user: current_user); 
      redirect_to friends_path
    else 
      flash.now[:error] = 'friend request couldnt be sent unfortunately.'
      render :index  
    end 
  end 

  def destroy 
    friend_request = Friend.find(params[:id])

    if friend_request.destroy 
      flash[:success] = "Request Unsent."
      
    else 
      flash[:error] = "Unable to undo request."
    end 
    redirect_to friends_path
  end 

  def create 
    params = CGI.parse(URI.parse(request.url).query)
    
    friend_request = Friend.find_by(id: params["friend_request_id"])
    friend_request.accepted = true 
    if friend_request.save 
      flash[:success] = 'Friend Request accepted.'
      redirect_to friends_path
    else 
      flash.now[:error] = 'Friend request could not be accepted unfortunately.'
      render :index
    end 
    
  end 

  private





end
