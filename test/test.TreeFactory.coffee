require 'coffee-trace'
should = require 'should'
TreeFactory = require '../src/TreeFactory'
describe "TreeFactory", ->

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
		_executionFactory = 
			create: -> referenceCount++

		treeFactory = new TreeFactory _executionFactory
		treeFactory.setup root
		referenceCount.should.equal 7


	