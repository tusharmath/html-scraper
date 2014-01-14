class RecursiveCaller
	constructor: (@tree) ->
		@count = 0

	_recursiveCall: (node) ->
		@count++
		@onEach node if @onEach
		if @onTrue node
			for link in node.links 
				@_recursiveCall link

	execute: (@onEach, @onTrue = -> true) ->
		@_recursiveCall @tree
		@count

module.exports = RecursiveCaller