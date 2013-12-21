should = require 'should'
ExecutorFactory= require '../src/ExecutorFactory'
describe "ExecutorFactory", ->
	class alpha
		constructor: (@arg1, @arg2) -> 
	
	class beta
	
	class charlie
	charlie.$inject = ['http']

	it "should create objects", ->
		e = new ExecutorFactory {alpha, beta}
		result = e.create('beta')
		result.should.be.an.instanceOf beta

	it "should set constructor arguments", ->
		e = new ExecutorFactory {alpha, beta}
		args = [{a:1}, {b:2}]
		result = e.create('alpha', args)
		
		result.arg1.a.should.equal 1
		result.arg2.b.should.equal 2

	###
	No need to inject, will use mockery
	it 'should inject dependencies', ->
		e = new ExecutorFactory {charlie}
		e.create('charlie')
		
		charlie.$using['http'].should.equal require 'http'
	###