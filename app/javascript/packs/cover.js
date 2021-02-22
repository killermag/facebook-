
let cover_form = document.querySelector('#cover_form'); 
let file_upload = document.querySelector('#user_cover'); 

cover_form.addEventListener('click', () => {
  file_upload.click(); 
});

file_upload.addEventListener('change', () => {
  cover_form.submit().click(); 
});