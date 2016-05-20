module.exports = {
  toggleSidebar: function (el, props) {
    el.addEventListener("click", function(event){
      event.preventDefault()
      var sideBar = document.getElementById("sidebar")
      if (sideBar.classList.contains("sidebar--open")) {
        sidebar.classList.remove("sidebar--open")
      } else {
        sidebar.classList.add("sidebar--open")
      }
    });
  },
}
