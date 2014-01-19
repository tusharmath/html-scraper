class RecursiveCaller

	#Binds the callbacks
	bind: (@ref) ->

	#Counts the nodes in the tree
	count: (node) ->i=0; @_dfs(node, -> i++); i

	#Calls a function with the first parameter as node
	_argsBuilder : (funct, ref, node, args)->
		temp = [node]
		funct.apply ref, temp.concat args


	#Method to call on node	
	_onEach : (ref, onEach, node, content) ->
		onEach.call ref, node, content
	
	_forAll : (node, callback, args...) ->
		for link in node.links
			@_argsBuilder callback, @, link, args

	_dfs: (node, onEach) ->
		@_onEach @ref, onEach, node
		@_forAll node, @_dfs, onEach
		
	_dfsIf: (node, onEach, ifOnly, content) ->
		_onEach @ref, onEach, node, content
		canProceed = ifOnly.call @ref, node
		_forAll( node, _dfsIf, onEach, ifOnly, canProceed) if canProceed
	

	execute: (tree, onEach = -> true) -> @_dfs tree, onEach
	executeIf: (tree, onEach, ifOnly) -> _dfsIf tree, onEach, ifOnly
	

module.exports = RecursiveCaller