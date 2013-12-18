should = require 'should'
ExecutionTree = require '../src/ExecutionTree'
describe "ExecutionTree", ->

	methods = ['http', 'select', 'extract']

	it 'root node should properly named', ->
		e = new ExecutionTree
		e.setup methods
		e.name.should.equal '$root'
	
	it 'should have commands', ->
		#Dummy objects
		x = first:1
		y = second:1

		e = new ExecutionTree
		e.setup methods
		h = e.http()
		h.select x
		h.select().extract y

		#First should be HTTP
		e.links[0].name.should.equal 'http'

		#Select 1
		e.links[0].links[0].name.should.equal 'select'
		e.links[0].links[0].args['0'].should.equal x


		#Select 2
		e.links[0].links[1].links[0].name.should.equal 'extract'
		e.links[0].links[1].links[0].args['0'].should.equal y


	it 'should have links', ->
		e = new ExecutionTree 'apples'
		e.should.have.property 'links'