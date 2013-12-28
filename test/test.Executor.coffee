should = require 'should'
Executor = require '../src/Executor'
describe "Executor", ->
	### Sample Execution Tree
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
	###

	it 'should stop on no response', ->
		pipe = {}
		link = name: 'sample-link-name', links: []
		executable =
			execute: (pipe, callback)-> callback(hasData: -> false)
		e = new Executor 
		called = 0
		e.onComplete = (response)-> called++
		e._executeLink executable, null, link
		called.should.equal 0
		e.count.should.equal -1


	it 'should execute link', (done)->
		pipe = {}
		link = name: 'sample-link-name', links: []
		executable =

			execute: (pipe, callback)->
				response =
					getPersistentData: -> 'i-am-executed'
					hasData: -> true
				callback response
		e = new Executor 
		e.onComplete = (response)-> 
			response.should.equal 'i-am-executed'
			done()
		e._executeLink executable, null, link