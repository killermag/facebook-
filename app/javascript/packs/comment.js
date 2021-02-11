addEventListener('turbolinks:load', openDropdown);

function openDropdown() {
  let togglers = document.querySelectorAll('.comment-dropdown-toggler');
  for (let i = 0; i < togglers.length; i++) {
    togglers[i].addEventListener('click', () => {
      let dropdown = togglers[i].querySelector('.comment-dropdown');
      dropdown.classList.contains('hidden') ? isClosed = true : isClosed = false; 
      closeDropdowns();
      if (isClosed) {
        dropdown.classList.toggle('hidden');
      }
    })
  }
}

function closeDropdowns() {
  let togglers = document.querySelectorAll('.comment-dropdown-toggler');
  for (let i = 0; i < togglers.length; i++) {
    let dropdown = togglers[i].querySelector('.comment-dropdown');
    if (!dropdown.classList.contains('hidden')) {
      dropdown.classList.toggle('hidden');
    } else {
      continue;
    }
  }
}