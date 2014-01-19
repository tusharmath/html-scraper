class TreeBFS
	constructor: (@tree) ->
		@count = 0

	_recursiveCall: (node, response) ->
		@count++
		response = @onEach.call @ref, node, response
		if response isnt false and response isnt undefined
			for link in node.links 
				@_recursiveCall link, response

	execute: (@ref, @onEach = -> true) ->
		@_recursiveCall @tree
		@count

module.exports = TreeBFS