__no_data__ = {}
class DataPipe

	constructor : (@persistentData={}) ->
		@transientData = __no_data__
		
	hasData : -> not (@transientData is __no_data__)

	getTransientData : -> @transientData
	addTransientData : (transientData)->
		@transientData = [] if @transientData is __no_data__
		@transientData.push transientData
		
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
		
	create : ()->
			new DataPipe @persistentData

module.exports = DataPipe