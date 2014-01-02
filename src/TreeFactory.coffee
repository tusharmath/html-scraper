#Creates objects using execution factory in the tree
class TreeFactory
	constructor: (@executables) ->

	_getExecutable:(name, args) ->
		funct = ->
		funct::= @executables[name] ::
		obj = new funct
		@executables[name].apply obj, args	
		obj

	_setup: (node) ->
		node.obj = @_getExecutable node.name, node.args
		@_setup link for link in node.links

	setup: (executionTree) ->
		@_setup executionTree

module.exports = TreeFactory