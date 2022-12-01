/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */


function myFunction() {
  document.getElementById("myDrop").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('#burger-menu')) {
    const dropdowns = document.getElementsByClassName("dropdown-content");
   
    for (let i = 0; i < dropdowns.length; i++) {
      let openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}