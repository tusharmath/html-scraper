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
		bucketFactory = create: -> 'dummy-bucket'
		treeFactory = new TreeFactory {alpha, beta}, bucketFactory
		link = {}
		treeFactory._addBucket link
		link._bucket.should.equal 'dummy-bucket'

	it 'should add parent', ->
		treeFactory = new TreeFactory 
		link = {}
		treeFactory._addParent link, 'sample-parent'
		link._parent.should.equal 'sample-parent'

	it 'should return count',->
		referenceCount = 0
		bucketFactory =
			create: ->
			global: ->	
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

	it 'should set bucket for root as global', ->
		bucketFactory = global: -> 'sample-bucket'
		node = {}
		e = new TreeFactory {alpha, beta}, bucketFactory
		e._setupRoot node
		node._bucket.should.equal 'sample-bucket'
		