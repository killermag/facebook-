import consumer from "./consumer"

consumer.subscriptions.create("NotifChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (data) {
      console.log("got data")
      let feed = document.querySelector('.feed-right'); 
      feed.insertAdjacentHTML('beforeend',`<div> ${data.title} </div>`)  
    } else {
      console.log("didnt get data"); 
    }; 


  }, 

  template(data) {
    return   }
});
