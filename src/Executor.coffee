class Executor
	constructor :(@dfs, @tree, @no, @perstBucket) ->		
		@rCount = value: 0		
	
	#Add to persistent data if req /TESTED
	_addPersistentData: (data, name) ->
		@perstBucket.addContent name, data if name

	#Default response callback
	_onResponse: (data, persist, node) ->
		@_addPersistentData data, persist
		@no.addBucketContent node, data


	_executeLink: (node, content) ->
		node._instance.execute content

	#Checks if the node's chldren can be executed /tested
	_canExecute: (node) ->
		if @no.canExecuteChildren(node)
			return node._bucket.getContent()
		false

	_executor: (node) ->
		@dfs.executeIf node, @_executeLink, @_canExecute

	#The main method	
	execute : (@onComplete) ->
		#Binds the 
		@dfs.bind @
		_executor @tree while rCount.value isnt 0
	

module.exports = Executor