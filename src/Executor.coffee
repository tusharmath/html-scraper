class Executor
	constructor :(@executorFactory, @executionTree) ->
	
	execute : (onComplete) ->

		executor = (node, pipe) =>

			#Iterate through all links
			node.links.forEach (link) =>

				#Create an executable
				executable = 
					@executorFactory.create link.name, link.args

				#Execute
				executable.execute pipe, (response) ->
					if link.links.length >= 1
						executor link, response
					else onComplete response


		executor @executionTree


module.exports = Executor