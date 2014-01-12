#Data is persisted even on fetching
class PersistentBucket 
	constructor: () -> @bucketContent = {}

	addContent: (name, data) ->
		@bucketContent[name] = [] if @bucketContent[name] is undefined
		@bucketContent[name].push data
	
	getContent: (name) -> 
		return @bucketContent[name] if name
		@bucketContent

#Date gets removed when retrived
class AlterableBucket
	constructor: ->
		@bucketContent = []

	addContent: (response) -> @bucketContent.push response
	
	getContent: -> @bucketContent.shift()
	
	isntEmpty: -> @bucketContent.length > 0

#Creates data buckets for nodes
class BucketFactory
	setup: () -> @globalBucket = new PersistentBucket
	create : () -> new AlterableBucket
	global : ->  @globalBucket


module.exports = {PersistentBucket, AlterableBucket, BucketFactory}