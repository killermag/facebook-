document.addEventListener('turbolinks:load', () => {
  let image_div = document.querySelector('.image-div');

  image_div.addEventListener('click', () => { document.querySelector('#image-upload').click() })

});

