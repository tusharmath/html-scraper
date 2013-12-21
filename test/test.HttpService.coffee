mockery = require './mocked'
should = require 'should'
HttpService = {}
describe "HttpService", ->
	
	before ->
		mockery.enable
			warnOnReplace: false
			warnOnUnregistered: false
		HttpService = require '../src/HttpService'

	after ->
		mockery.disable()

	it 'should make requests', (done) ->
		http = new HttpService 'url'
		pipe =
			getTransientData: -> {}
			newPipeData: (data) -> data


		http.execute pipe, (response)->
			require('./sampleHttpResponse.json').data.should.equal response
			done()
