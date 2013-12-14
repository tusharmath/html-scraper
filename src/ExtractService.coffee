{IExecutableService} = require './Executables'
cheerio = require 'cheerio'

class ExtractService extends IExecutableService
	constructor: (name, extractFunction) ->
		

		@run = (callback, pipedData) ->
			#Iterate over elements
			for e in pipedData.getTransientData()
				
				#Load Cheerio
				c = cheerio.load e

				#Parse using Cheerio and persistent data
				result =  extractFunction c, pipedData.getPersistentData()

				#Add result to persistentData
				pipedData.addPersistentData name, result

				#Create a new Pipe with transient data
				callback pipedData.newPipeData result


module.exports = ExtractService