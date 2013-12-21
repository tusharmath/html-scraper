class ExecutorFactory
	constructor: (@executables) ->
	create: (name, args) ->
		funct = ->

		funct :: = @executables[name] ::
		obj = new funct
		@executables[name].apply obj, args	
		obj
	
module.exports = ExecutorFactory