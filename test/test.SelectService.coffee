mockery = require './mocked'

SplitService = require '../src/SplitService'
cheerio = {}

describe 'SplitService', ->
		
	before ->
		mockery.enable
			warnOnReplace: false
			warnOnUnregistered: false
		ExtractService = require '../src/ExtractService'
		
	
	after ->
		mockery.disable()

	it 'should run', (done)->
		s = new SplitService 'xxx'
		pipe =
			getTransientData: ->
			create: -> 'new-pipe'
		s.execute pipe, (result) ->
			result.should.equal 'new-pipe'
			done()
