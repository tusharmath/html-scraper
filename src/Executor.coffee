class Executor
	constructor :(@executionTree) ->		
		@rCount = value: 0		
	
	#Checks for a leaf node /TESTED
	_isntLeaf: (node)-> node.links.length > 0

	#Add to persistent data if req /TESTED
	_addPersistentData: (data, name) ->
		@perBucket.addContent name, data if name

	#Add to node's bucket /TESTED
	_addBucketContent: (node, data) ->
		node._bucket.addContent data

	#Setting up instead in constructor to have more control /TESTED
	_setupPersistentBucket: ->
		@perBucket = @executionTree._bucket
	
	#Executes a link with params /TESTED
	_executeLink: (node, content) ->
		#Execute the node with params
		node._instance.execute content
		
	#Default response callback
	_onResponse: (node, data, persist) ->
		_addPersistentData data, persist
		_addBucketContent node, data

	#Sets up the common parameters req by all mods
	_setupCommonParams: (node) ->
		node._instance.setup(
			@rCount,
			@perBucket,
			(d,n)=> @_onResponse d,n
		)

	#Recrusively call a method with a base obj
	_recursiveCall: (node, ref, callback) ->
		callback.call ref, node
		for link in node.links
			@_recursiveCall link, ref, callback

	_executor: (node) ->
		_recursiveCall node, @, _executeLink 
		if _isntLeaf node and node._bucket.isntEmpty() 
			content = node._bucket.getContent()
			for link in node.links
				_executeLink link, content
		
	#Sets up common params for all nodes
	_setupCommonParamsForAll: ->
		@_recursiveCall @executionTree, @, @_setupCommonParams

	#The main method
	execute : (@onComplete) ->
		_setupPersistentBucket()
		_setupCommonParamsForAll()
		_executor @executionTree while rCount.value isnt 0
	

module.exports = Executor