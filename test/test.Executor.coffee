
Executor = require '../src/Executor'
describe "Executor", ->

	root =
		links: [
			links:[]
		,
			links:[
				links: [
					links: []
				,
					links: []
				]
			,
				links: []
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
	###
	it 'should execute each link except $root', ->

		count = 0
		e = new Executor root
		
		#Mocking _executeLink
		e._executeLink = (pipe, link) ->
			count++
			@_executor(link)
		e.execute()
			
		count.should.equal 6

	###
	
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
	###