should = require 'should'
{ExecutorFactory} = require '../src/Executables'
describe "ExecutorFactory", ->
	class alpha
		constructor: (@args) -> 
	
	class beta
	
	class charlie
	charlie.$inject = ['http']

	it "should create objects", ->
		e = new ExecutorFactory {alpha, beta}
		result = e.create('beta')
		result.should.be.an.instanceOf beta

	it "should set constructor arguments", ->
		e = new ExecutorFactory {alpha, beta}
		args = a:1, b:2
		result = e.create('alpha', args)
		result.args.a.should.equal 1
		result.args.b.should.equal 2

	###
	No need to inject, will use mockery
	it 'should inject dependencies', ->
		e = new ExecutorFactory {charlie}
		e.create('charlie')
		
		charlie.$using['http'].should.equal require 'http'
	###