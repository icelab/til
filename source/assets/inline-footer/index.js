require('fontfaceobserver')

/**
 * List of fonts we care about loading
 * @type {Array}
 */
var fontsToCheck = [
  {
    family: 'National',
    style: 'normal',
    weight: 'normal'
  },
  {
    family: 'National',
    style: 'italic',
    weight: 'normal'
  },
  {
    family: 'National',
    style: 'italic',
    weight: 'bold'
  },
  {
    family: 'National',
    style: 'italic',
    weight: 'bold'
  },
  {
    family: 'TiemposText',
    style: 'normal',
    weight: 'normal'
  },
  {
    family: 'TiemposText',
    style: 'italic',
    weight: 'normal'
  },
  {
    family: 'TiemposText',
    style: 'italic',
    weight: 'bold'
  },
  {
    family: 'TiemposText',
    style: 'italic',
    weight: 'bold'
  },
  {
    family: 'Inconsolata',
    style: 'normal',
    weight: '400'
  },
  {
    family: 'Inconsolata',
    style: 'italic',
    weight: '400'
  }
]

/**
 * Font loading
 * Implements deferred font-loading
 * https://www.filamentgroup.com/lab/font-events.html
 */

function fontsLoaded (fontsToCheck) {
  var fontsLoaded = window.localStorage.getItem('fontsLoaded')

  if (!fontsLoaded) {
    var loading = []
    fontsToCheck.forEach(function (font) {
      var promise = new window.FontFaceObserver(font.family, {
        weight: font.weight,
        style: font.style
      })
      loading.push(promise.check())
    })

    Promise.all(loading).then(function () {
      window.document.documentElement.className += ' fonts-loaded'
      window.localStorage.setItem('fontsLoaded', true)
    })
  }
}

fontsLoaded(fontsToCheck)
