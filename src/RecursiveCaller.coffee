class RecursiveCaller
	constructor: (@tree) ->
		@count = 0

	_recursiveCall: (node) ->
		@count++
		@onEach.call @ref, node, @args if @onEach
		if @onTrue.call @ref, node, @args
			for link in node.links 
				@_recursiveCall link

	execute: (@ref, @args, @onEach, @onTrue = -> true) ->
		@_recursiveCall @tree
		@count

module.exports = RecursiveCaller