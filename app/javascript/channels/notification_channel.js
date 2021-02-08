import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('disconnection');
  },

  received(data) {
    console.log(data);
    document.querySelector('body').insertAdjacentElement('beforeend', template(data));
  },

  template(data) {
    return `
      <div> ${data} </div> 
    `
  }, 
});
