class TreeBFS
	_recursiveCall: (node, onEach, ref) ->
		onEach.call ref, node
		for link in node.links 
			@_recursiveCall link, onEach, ref



	count: (node) ->
		i =0
		@_recursiveCall node, -> i++
		i

	execute: (ref, tree, onEach = -> true) ->
		@_recursiveCall tree, onEach, ref


module.exports = TreeBFS