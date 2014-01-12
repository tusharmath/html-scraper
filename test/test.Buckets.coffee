{PersistentBucket, AlterableBucket, BucketFactory} = require '../src/Buckets'

describe "AlterableBucket", ->
	it 'should add/remove Content', ->
		b = new AlterableBucket;
		b.addContent 'sample-data'
		b.bucketContent[0].should.equal 'sample-data'
		b.getContent().should.equal 'sample-data'

	it 'should return empty', ->
		b = new AlterableBucket
		b.isntEmpty().should.equal false
	


describe "PersistentBucket", ->
	it 'should add Content with name', ->
		b = new PersistentBucket;
		b.addContent 'sample-name', 'sample-data'
		b.bucketContent['sample-name'].should.be.an.instanceof Array


	it 'should save data', ->
		b = new PersistentBucket;
		b.addContent 'sample-name', 'sample-data'
		b.getContent('sample-name')[0].should.equal 'sample-data'
