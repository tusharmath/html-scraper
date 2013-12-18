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

	it 'should return result on execution', (done)->
		DataPipe = require 'mocked-dataPipe'
		e = new ExtractService 'doobie', -> 'take-this-response'
		e.execute DataPipe, (dataPipe)->
			dataPipe.should.equal 'take-this-response'
			done()


	it 'should pass cheerio on execution', (done)->
		DataPipe = require 'mocked-dataPipe'
		e = new ExtractService 'doobie', (cheerio, persistentData)-> 

			cheerio().should.equal 'cheerio-loaded'
			persistentData.should.equal 'persistent-data'
			done()
			
		e.execute DataPipe, ->


	it 'should have an execute method', ->
		e = new ExtractService
		e.should.have.property 'execute'
