class NodeOperation
	#Fetch operations
	isntLeaf: (node)-> node.links.length > 0
	canExecuteChildren: (node) ->
		@isntLeaf(node) and node._bucket.isntEmpty()

	#Put operations
	addBucketContent: (node, data) ->
		node._bucket.addContent data

	#Needs to be called from outside
	setExecutorParams: (node, executor) ->
		node._instance.setup(
			executor.rCount,
			executor.perstBucket,
			(data,name)=> executor._onResponse data,name, node
		)

module.exports = NodeOperation