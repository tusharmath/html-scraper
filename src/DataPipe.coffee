__no_data__ = {}
class DataPipe

	constructor : (@transientData = __no_data__, @persistentData={})->
		
		
	hasData : -> not (@transientData is __no_data__)

	getTransientData : -> @transientData
	#addTransientData : -> 
		
	addPersistentData : (name, data) ->
			if not @persistentData[name]
				@persistentData[name] = []
			@persistentData[name].push data

	clearPersistentData : (name)->
			@persistentData[name] = []
		
	getPersistentData : (name) ->
			if name
				return @persistentData[name]
			else	
				@persistentData
		
	create : (transientData)->
			new DataPipe transientData, @persistentData

	
module.exports = DataPipe