should = require 'should'
Executor = require '../src/Executor'
describe "Executor", ->
	
	it 'should pipe response',(done) ->
		_factory = 
			create: (name, args) ->
				execute:(pipedData, callback) ->
					pipedData = pipedData or ''
					pipedData += "#{name}--"
					callback pipedData


		e = new Executor _factory
		e.register 'alpha'
		e.register 'beta'
		e.register 'charlie'
		e.execute (response) ->
			response.should.equal 'alpha--beta--charlie--'
			done()

	
	it 'should execute', (done)->
		_factory = 
			create: (name, args) ->
				execute:(pipedData, callback) ->
					callback 'this is the response'

	

		e = new Executor _factory
		e.register 'alpha'
		e.execute (response) ->
			response.should.equal 'this is the response'
			done()

	it "should register", ->
		e = new Executor
		args = a:1, b:2
		name = 'dummy'
		e.register name, args
		e.executionChain[0].name.should.equal name
		e.executionChain[0].args.should.equal args

	it "should create objects", ->
		_factory = 
			create: (name, args) -> {name, args}
			
		e = new Executor _factory
		args = a:1, b:2
		name = 'dummy'
		e.register name, args
		obj = e.createObject 0
		obj.name.should.equal name
		obj.args.should.equal args