let form = document.querySelector('#cover_form');
let cover_div = document.querySelector('#me_cover');
let file_field = document.querySelector('#user_cover'); 

cover_div.addEventListener('click', () => {
  file_field.click(); 
})

file_field.addEventListener('change', () => {
  form.submit().click(); 
})
