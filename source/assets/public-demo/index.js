var domready = require('domready')
var viewloader = require('viewloader')

var views = require('./views')

domready(function () {
  viewloader.execute(views)
})
