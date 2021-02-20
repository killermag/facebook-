let profile = document.querySelector('.profile-pic'); 
let uploadButton = document.querySelector('#user_profile_picture'); 
let form = document.querySelector('#profile_form'); 


uploadButton.addEventListener('change', () => {
  form.submit.click(); 
})

profile.addEventListener('click', () => {
  uploadButton.click(); 
})
