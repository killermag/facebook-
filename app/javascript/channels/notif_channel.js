import consumer from "./consumer"

consumer.subscriptions.create("NotifChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    
    let notificationsDropdown = document.querySelector('.notifications-dropdown'); 
    notificationsDropdown.insertAdjacentHTML('beforeend', this.template(data));
    let notificationsButton = document.querySelector('.Notifications');
    animateNotifications(notificationsButton);
    setTimeout(() => {
      animateNotifications(notificationsButton);
    }, 2000);
    
    
  }, 

  template(data) {
   
    return `
    <a class="p-1 flex hover:bg-gray-100 cursor-pointer" href="/friends">
      <img x="0" y="0" class="rounded-full h-10 w-10" height="100%" preserveaspectratio="xMidYMid slice" width="100%" src="https://scontent-ort2-2.xx.fbcdn.net/v/t1.30497-1/c35.0.120.120a/p120x120/84241059_189132118950875_4138507100605120512_n.jpg?_nc_cat=1&amp;ccb=2&amp;_nc_sid=7206a8&amp;_nc_ohc=p9OnxhNOvn4AX97lUx6&amp;_nc_ht=scontent-ort2-2.xx&amp;tp=27&amp;oh=f09856717e5c2613710bf4e6d0b90b78&amp;oe=603D3765">
      <div class="pl-2">${data.user.username} sent you a friend_request. </div>
    </a>  
    `
  },

});


function animateNotifications(button) {
  button.classList.toggle('animate-ping');
}