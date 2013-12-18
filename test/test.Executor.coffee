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
	
	it 'should execute & pipe all links', (done)->
		_factory = create : (name) ->
			execute: (pipe, callback) ->
				callback  (pipe or '') + name + '-executed-'
		str = []
		e = new Executor _factory, _executionTree
		e.execute (response) ->
			str.push response
			if str.length is 3
				str.should.eql [
					'first-executed-'
					'second-executed-third-executed-xx-executed-'
					'second-executed-third-executed-yy-executed-']
				done()

