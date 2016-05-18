var highlight = require('highlight.js')

module.exports = {
  /**
   * Highlight code blocks using highlight.js
   */
  highlight: function (el, props) {
    var blocks = el.querySelectorAll('pre code')
    for (var i = 0; i < blocks.length; i++) {
      highlight.highlightBlock(blocks[i])
    }
  },
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
