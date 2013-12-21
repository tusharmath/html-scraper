should = require 'should'
Executor = require '../src/Executor'
describe "Executor", ->
	_executionTree =
		name: '$root'
		links: [
			name: 'first',
			links: []
		,	
			name: 'second',
			links: [
				name: 'third',
				links: [
					name: 'xx'
					links:[]
				,
					name: 'yy'
					links:[]
				]
			]
		]

	it 'should execute link', (done)->
		pipe = {}
		link = name: 'sample-link-name', links: []
		executable =
			execute: (pipe, callback)->
				response = getPersistentData: -> 'i-am-executed'
				callback response
		e = new Executor 
		e.onComplete = (response)-> 
			response.should.equal 'i-am-executed'
			done()
		e._executeLink executable, null, link