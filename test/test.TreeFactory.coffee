require 'coffee-trace'
should = require 'should'
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

	it 'should go thru all links',->
		referenceCount = 0
		treeFactory = new TreeFactory {alpha, beta}

		#Mocking GetExecutable
		treeFactory._getExecutable = -> referenceCount++
		treeFactory.setup root
		referenceCount.should.equal 7


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