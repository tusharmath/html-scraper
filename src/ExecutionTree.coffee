class ExecutionTree
	constructor: (@_name, @_args) -> @links = []
	addExecutionLink: (name, args) ->
		node = new ExecutionTree name, args
		@links.push node
		node

module.exports = ExecutionTree