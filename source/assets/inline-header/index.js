/**
 * Check if fonts are cached
 */
if (window.localStorage.getItem('fontsLoaded')) {
  window.document.documentElement.className += ' fonts-loaded'
}

/**
 * Load fonts from Google Fonts
 */
window.WebFontConfig = {
  google: {
    families: [
      'Inconsolata:400,700:latin'
    ]
  }
}

var webFontElement = document.createElement('script')
webFontElement.src = (document.location.protocol === 'https:' ? 'https' : 'http') +
  '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js'
webFontElement.type = 'text/javascript'
webFontElement.async = 'true'
var first = document.getElementsByTagName('script')[0]
first.parentNode.insertBefore(webFontElement, first)
