class DataPipe
	constructor : (transientData = {}, persistentData = {})->
		
		_private =  {persistentData, transientData}

		@getTransientData = -> _private.transientData
		
		@addPersistentData = (name, data) ->
			_private.persistentData[name] = data
		
		@getPersistentData = (name) ->
			_private.persistentData[name]
		
		@newPipeData = (transientData)-> 
			new DataPipe transientData, _private.persistentData

	
module.exports = DataPipe