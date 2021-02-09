class NotifChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    if current_user 
      stream_for current_user 
    else
      reject 
    end 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
