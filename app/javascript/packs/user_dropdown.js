addEventListener("turbolinks:load", () => {
  let UserInfo = document.querySelector('.UserInfo');
  let dropdown = document.querySelector('.userinfo-dropdown');

  if (UserInfo && dropdown) {
    UserInfo.addEventListener('click', () => {
      closeNotifDropdown();
      dropdown.classList.toggle('hidden');
      dropdown.classList.toggle('flex');
    })
  } else {
    return 
  };
  
  
});


function closeNotifDropdown() {
  let notificationDropdown = document.querySelector('.notifications-dropdown');
  if (notificationDropdown.classList.contains('hidden')) {
    return NaN;
  } else {
    notificationDropdown.classList.add('hidden');
  };
}
