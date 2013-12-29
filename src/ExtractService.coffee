IExecutable = require './IExecutable'
$ = require 'cheerio'

class ExtractService extends IExecutable
	constructor: (@name, @extractFunction) ->
		
	_createPipe: (pipe, response, callback)->
		callback pipe.create response
		
	_addPersistentData: (name, pipe , response) ->
		pipe.addPersistentData name, response
	
	_extract: (pipe, e) ->

		@extractFunction $(e), pipe.getPersistentData()

	_run : (e, pipe, callback) ->

		#Parse using Cheerio and persistent data
		result = @_extract pipe, e

		#Add result to persistentData
		@_addPersistentData @name, pipe, result

		#Create a new Pipe with transient data
		@_createPipe pipe, result, callback


	run : (callback, pipe) ->
		#Iterate over elements selected [Select Service returns Array]
		@_run e, pipe, callback for e in pipe.getTransientData()
			
module.exports = ExtractService