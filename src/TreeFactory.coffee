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
		link.bucket = @bucketFactory.create()

	_addInstance: (link) ->
		link.instance = @_getExecutable link.name, link.args

	_setup: (node) ->
		@count += node.links.length
		for link in node.links
			@_addInstance link
			@_addBucket link
			@_setup link
		

	setup: (executionTree) ->
		@_setup executionTree
		@count

module.exports = TreeFactory