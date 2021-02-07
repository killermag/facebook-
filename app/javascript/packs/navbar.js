addEventListener("turbolinks:load", () => {
  let UserInfo = document.querySelector('.UserInfo');
  let dropdown = document.querySelector('.userinfo-dropdown');

  if (UserInfo && dropdown) {
    UserInfo.addEventListener('click', () => {
      dropdown.classList.toggle('hidden');
      dropdown.classList.toggle('flex');
    })
  } else {
    return 
  };
  
  
});

