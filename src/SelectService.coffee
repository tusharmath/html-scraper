IExecutable = require './IExecutable'
cheerio = require 'cheerio'

#Makes Get requests only
class SelectService extends IExecutable
	constructor: (cssSelector) ->
		@run = (callback, newPipeData) ->
			#Url  received from extractService
			doc = pipe.getTransientData()
			$ = cheerio.load doc
			callback pipe.newPipeData $ cssSelector

module.exports = SelectService