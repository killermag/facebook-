addEventListener('turbolinks:load', openPostDropdown);

function openPostDropdown() {
  let togglers = document.querySelectorAll('.open-dropdown'); 
  for (let i = 0; i < togglers.length; i++) {
    let parent = togglers[i]; 
    parent.addEventListener('click', () => {
      let child = parent.firstElementChild; 
      child.classList.contains('hidden') ? isClosed = true : isClosed = false; 
      closeAllDropdowns(togglers);
      if (isClosed) {
        child.classList.toggle('hidden');
      }

        
    })
  };
};


function closeAllDropdowns(toggler) { 
  for (let i = 0; i < toggler.length; i++) {
    let child = toggler[i].firstElementChild;
    if (child) {
      if (!child.classList.contains('hidden')) {
        child.classList.toggle('hidden')
      }
    };

  };
};
