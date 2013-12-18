mockery = require 'mockery'

cheerio = 
	load : -> -> 'cheerio-loaded'

dataPipe = 
	getTransientData : -> ['transient-data']
	addPersistentData: ->
	getPersistentData: -> 'persistent-data'
	newPipeData: (x)-> x

mockery.registerMock 'cheerio', cheerio
mockery.registerMock 'mocked-dataPipe', dataPipe

module.exports = mockery