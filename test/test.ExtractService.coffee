mockery = require './mocked'
should = require 'should'
ExtractService = {}

describe "ExtractService", ->
	
	before ->
		mockery.enable
			warnOnReplace: false
			warnOnUnregistered: false
		ExtractService = require '../src/ExtractService'

	after ->
		mockery.disable()

	it 'should execute parser', ->
		e = new ExtractService

	it 'should add persistent data', ->
		pipe =
			addPersistentData : (name, response)->
				name.should.equal 'sample-name'
				response.should.equal 'sample-data'
		e = new ExtractService
		e._addPersistentData 'sample-name', pipe, 'sample-data'

	it 'should create new transient data', (done)->
		pipe =
			create : (data) -> data
		e = new ExtractService 'delta', ->
		e._createPipe pipe, 'sample-data', (data) ->
			data.should.equal 'sample-data'
			done()


	it 'should return result on execution',->
		pipe =
			getPersistentData: ->
		e = new ExtractService 'doobie', -> 'take-this-response'
		e._extract(pipe).should.equal 'take-this-response'

	it 'should send saved data as parameter', (done) ->
		pipe =
			getPersistentData: -> 'sample-data'

		e = new ExtractService 'sample-name', (a,b)->
			b.should.equal 'sample-data'
			done()
		e._extract pipe

	it 'should pass cheerio on execution', (done)->
		pipe =
			getPersistentData: ->
		
		e = new ExtractService 'jump', (doc) ->
			doc.should.equal 'abc-from-cheerio'
			done()
		
		e._extract(pipe, 'abc')


	it 'should have an execute method', ->
		e = new ExtractService
		e.should.have.property 'execute'
