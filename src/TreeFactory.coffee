#Creates objects using execution factory in the tree
class TreeFactory
	constructor: (@executionFactory) ->

	_getExecutable:(node, executionFactory) ->
		executionFactory.create node.name, node.args

	_setup: (node) ->
		node.obj = @_getExecutable node, @executionFactory
		@_setup link for link in node.links

	setup: (executionTree) ->
		@_setup executionTree

module.exports = TreeFactory