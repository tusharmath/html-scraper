mockery = require './mocked'
should = require 'should'
SelectService = require '../src/SelectService'
cheerio = {}

describe 'SelectService', ->
		
	before ->
		mockery.enable
			warnOnReplace: false
			warnOnUnregistered: false
		ExtractService = require '../src/ExtractService'
		
	
	after ->
		mockery.disable()
