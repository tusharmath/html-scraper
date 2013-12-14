class Executor
	constructor :(@executorFactory)-> @executionChain = []
	register :(name, args) -> @executionChain.push {name, args}
	
	#Creates an object from the execution chain
	createObject: (index)->
		_exec = @executionChain[index]
		return @executorFactory.create _exec.name, _exec.args



	execute : (onComplete) ->


		executor = (i, pipedData) =>
			#Create an executable
			executable = @createObject i

			#Execute the executable, piping response
			executable.execute pipedData, (executionResponse) => 

				if i + 1 is @executionChain.length
					#Completed execution
					onComplete(executionResponse)
				else
					#Execution next in the chain
					executor(i+1, executionResponse)
		executor 0

module.exports = Executor