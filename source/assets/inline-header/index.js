/**
 * Check if fonts are cached
 */
if (window.localStorage.getItem('fontsLoaded')) {
  window.document.documentElement.className += ' fonts-loaded'
}
