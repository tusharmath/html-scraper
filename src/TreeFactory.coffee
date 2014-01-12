#Creates objects using execution factory in the tree
class TreeFactory
	constructor: (@executables, @bucketFactory) -> @count = 0

	_getExecutable:(name, args) ->
		funct = ->
		funct::= @executables[name] ::
		obj = new funct
		@executables[name].apply obj, args	
		obj

	_addBucket: (link) ->
		link._bucket = @bucketFactory.create()

	_addInstance: (link) ->
		link._instance = @_getExecutable link.name, link.args

	_addParent: (link, parent) -> link._parent = parent

	_addStatus: (link) -> link._isComplete = false

	_setup: (node) ->
		@count += node.links.length
		for link in node.links
			@_addInstance link
			@_addBucket link
			@_addParent link, node
			@_setup link
		
	_setupRoot: (root)->
		root._bucket = @bucketFactory.global()
	setup: (executionTree) ->
		@_setupRoot executionTree
		@_setup executionTree
		@count

module.exports = TreeFactory