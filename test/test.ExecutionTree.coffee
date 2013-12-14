should = require 'should'
ExecutionTree = require '../src/ExecutionTree'
describe "ExecutionTree", ->
	
	it 'should have links', ->
		e = new ExecutionTree 'apples'
		e.should.have.property 'links'

	it 'should register nodes', ->
		e = new ExecutionTree 'apples'
		grammy = e.addExecutionLink 'grammy'
		volts = grammy.addExecutionLink 'volts'

		e.links[0]._name.should.equal 'grammy'
		grammy.links[0]._name.should.equal 'volts'
