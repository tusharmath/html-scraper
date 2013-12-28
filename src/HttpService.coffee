IExecutable = require './IExecutable'
request = require 'request'

#Makes Get requests only
class HttpService extends IExecutable
	constructor: (key) ->
		
		@run = (callback, pipe) ->
			#Url  received from extractService
			url = pipe.getTransientData()[key]
			#console.log 'GET:', url
			#!url can not be of an array type. has to be a string!
			request url, (error, response, body) ->
				#Log error
				console.error error if error
				
				#Pipe response
				#WHy Array?
				callback pipe.newPipeData body

module.exports = HttpService