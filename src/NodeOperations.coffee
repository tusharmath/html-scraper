class NodeOperation
	#Fetch operations
	isntLeaf: (node)-> node.links.length > 0
	canExecuteChildren: (node) ->
		@isntLeaf(node) and node._bucket.isntEmpty()

	#Put operations
	addBucketContent: (node, data) ->
		node._bucket.addContent data

module.exports = NodeOperation