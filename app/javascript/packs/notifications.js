document.addEventListener('turbolinks:load', DisplayNotificationDropdown);

function DisplayNotificationDropdown() {


  let notificationToggler = document.querySelector('.Notifications');
  let notificationDropdown = document.querySelector('.notifications-dropdown');
  let userDropdown = document.querySelector('.userinfo-dropdown');
  notificationToggler.addEventListener('click' ,() => {
    closeUserDropdown();  
    notificationDropdown.classList.toggle('hidden');
  })

};

function closeUserDropdown () {
  let userDropdown = document.querySelector('.userinfo-dropdown');
  if (userDropdown.classList.contains('hidden')) {
    return NaN;
  } else {
    userDropdown.classList.add('hidden');
  };

};