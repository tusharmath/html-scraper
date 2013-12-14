class ExecutorFactory
	constructor: (@executables) ->
	create: (name, args) ->
		new  @executables[name] args
	
module.exports = ExecutorFactory