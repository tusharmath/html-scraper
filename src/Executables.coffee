class ExecutorFactory
	constructor: (@executables) ->
	create: (name, args) ->
		new  @executables[name] args
	
class IExecutableService
	execute: (pipedData, callback) -> @run(callback, pipedData)


###
class Http extends IExecutable
class Split extends IExecutable
class Extract extends IExecutable
###
module.exports = {IExecutableService, ExecutorFactory}