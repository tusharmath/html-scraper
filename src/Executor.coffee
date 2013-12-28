class Executor
	constructor :(@executorFactory, @executionTree, @pipe) ->
		@count = 0
	
	_incrementCount: -> @count++

	_decrementCount: -> @count--

	#Gets and executable from factory
	_getExecutable:(link, executorFactory) ->
		executorFactory.create link.name, link.args

	
	_executeLink: (executable, pipe, link) ->
		executable.execute pipe, (response) =>
			#Skip the execution if there is no response
			if response.hasData() is true
				if link.links.length >= 1
					@_executor link, response
				else if @count is 0
					@onComplete response.getPersistentData()
			@_decrementCount()

	_executor : (node, pipe) =>
		@_incrementCount()
		
		#Iterate through all links
		node.links.forEach (link) =>

			#Create an executable
			executable = @_getExecutable link, @executorFactory

			#Execute
			@_executeLink executable, pipe, link
		
	execute : (@onComplete) ->
		@_executor @executionTree, @pipe

module.exports = Executor