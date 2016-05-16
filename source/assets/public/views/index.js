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
  }
}
