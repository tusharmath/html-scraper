IExecutable = require './IExecutable'
cheerio = require 'cheerio'

#Makes Get requests only
class SplitService extends IExecutable
	constructor: (cssSelector) ->
		@run = (callback, pipe) ->

			#Url  received from extractService
			doc = pipe.getTransientData()
			$ = cheerio doc
			callback pipe.create $.find cssSelector

module.exports = SplitService