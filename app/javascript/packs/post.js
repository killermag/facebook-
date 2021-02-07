addEventListener('turbolinks:load', DisplayPostDropdown);

function DisplayPostDropdown() {
  dropdown_toggler = document.querySelector('.post-dropdown-toggle');
  dropdown_toggler.addEventListener('click', () => {
    dropdown = document.querySelector('.post-dropdown');
    dropdown.classList.toggle('hidden')
  })

};