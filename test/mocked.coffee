mockery = require 'mockery'

cheerio = (content)-> content + '-from-cheerio'
cheerio.load = -> -> 'cheerio-loaded'

request = (url, callback) ->
	callback undefined, undefined, require('./sampleHttpResponse.json').data


dataPipe = 
	getTransientData : -> ['transient-data']
	addPersistentData: ->
	getPersistentData: -> 'persistent-data'
	create: (x)-> x

mockery.registerMock 'cheerio', cheerio
mockery.registerMock 'mocked-dataPipe', dataPipe
mockery.registerMock 'request', request

module.exports = mockery