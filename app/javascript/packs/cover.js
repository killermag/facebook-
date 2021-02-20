let div = document.querySelector('#cover_div');
let form = document.querySelector('#cover_form');
let upload = document.querySelector('#user_cover');

upload.addEventListener('change', () => {
  form.submit.click();
})

div.addEventListener('click' , () => {
  upload.click(); 
})

