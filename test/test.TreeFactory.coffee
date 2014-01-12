require 'coffee-trace'

TreeFactory = require '../src/TreeFactory'
describe "TreeFactory", ->
	class alpha
		constructor: (@arg1, @arg2) -> 
	
	class beta
	
	root =
		links: [
			links:[]
		,
			links:[
				links: [
					links: []
				,
					links: []
				]
			,
				links: []
			]
		]

	it 'should add bucket', ->
		referenceCount = 0
		bucketFactory = create: -> 'dummy-bucket'
		treeFactory = new TreeFactory {alpha, beta}, bucketFactory
		link = {}
		treeFactory._addBucket link
		link.bucket.should.equal 'dummy-bucket'



	it 'should return count',->
		referenceCount = 0
		bucketFactory =
			create: ->
		treeFactory = new TreeFactory {alpha, beta}, bucketFactory

		#Mocking GetExecutable
		treeFactory._getExecutable = -> referenceCount++
		treeFactory.setup(root).should.equal 6


	it "should create objects", ->
		e = new TreeFactory {alpha, beta}
		result = e._getExecutable 'beta'
		result.should.be.an.instanceOf beta

	it "should set constructor arguments", ->
		e = new TreeFactory {alpha, beta}
		args = [{a:1}, {b:2}]
		result = e._getExecutable 'alpha', args
		
		result.arg1.a.should.equal 1
		result.arg2.b.should.equal 2