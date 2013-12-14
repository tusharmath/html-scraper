{IExecutableService} = require './Executables'
request = require 'request'

#Makes Get requests only
class HttpService extends IExecutableService
	constructor: (key) ->
		
		@run = (callback, pipedData) ->
			#Url  received from extractService
			item = pipedData.getTransientData()[key]
			urls = if typeof item is 'string' then [item] else item
			for url in urls
				request url, (error, response, body) ->
					#Log error
					console.error error if error
					
					#Pipe response
					callback pipedData.newPipeData [body]

module.exports = ExtractService