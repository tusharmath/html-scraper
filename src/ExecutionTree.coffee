class ExecutionTree
	constructor: (@name = '$root', @args) ->
		#Initialize links for a chain
		@links = []
		
	setup: (methods) ->

		# Define Methods
		methods.forEach (name)=>
			@[name] = () =>
				node = new ExecutionTree name, arguments
				#Re setup all methods
				node.setup methods
				@links.push node
				node

module.exports = ExecutionTree