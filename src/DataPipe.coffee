class DataPipe
	constructor : (transientData = {}, persistentData = {})->
		
		_private =  {persistentData, transientData}

		@getTransientData = -> _private.transientData
		
		@addPersistentData = (name, data) ->
			if not _private.persistentData[name]
				_private.persistentData[name] = []
			_private.persistentData[name].push data

		@clearPersistentData = (name)->
			_private.persistentData[name] = []
		
		@getPersistentData = (name) ->
			if name
				return _private.persistentData[name]
			else	
				_private.persistentData
		
		@newPipeData = (transientData)-> 
			new DataPipe transientData, _private.persistentData

	
module.exports = DataPipe