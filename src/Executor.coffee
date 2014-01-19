class Executor
	constructor :(@bfsEnabled) ->		
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
		@perBucket = @bfsEnabled.tree._bucket
	

	#Sets up the common parameters req by all mods
	_commonParams: (node) ->
		node._instance.setup(
			@rCount,
			@perBucket,
			(d,n)=> @_onResponse d,n
		)

	#Sets up common params for all nodes /tested
	_setupCommonParams: (commonParams) ->
		@bfsEnabled.execute @, commonParams

	#Checks if the node's chldren can be executed //tested
	_canExecuteChildren: (node) ->
		@_isntLeaf(node) and node._bucket.isntEmpty()

	
	_executor: (node) ->

		if @_canExecuteChildren (node)
			content = node._bucket.getContent()
			@bfsEnabled.execute @, null, (node, content)=>
				@_executeLink node, content
			, content


	#Executes a link with params /TESTED
	_executeLink: (node, content) ->
		#Execute the node with params
		node._instance.execute content
		
	#Default response callback
	_onResponse: (node, data, persist) ->
		_addPersistentData data, persist
		_addBucketContent node, data

	#The main method
	execute : (@onComplete) ->
		_setupPersistentBucket()
		_setupCommonParamsForAll()
		_executor @bfsEnabled.tree while rCount.value isnt 0
	

module.exports = Executor