let profile_div = document.querySelector('#me_profile');
let form = document.querySelector('#profile_form'); 
let profile_button = document.querySelector('#user_profile_picture'); 

profile_div.addEventListener('click' ,() => {
  profile_button.click(); 
})


profile_button.addEventListener('change', () => {
  form.submit().click(); 
})

