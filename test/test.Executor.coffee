
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

	it 'should setup count', ->
		e = new Executor
		
		e.rCount.value.should.equal(0)

	it 'should set common params'
	it 'should reqcursively call'
	it 'should update count'
	it 'should execute all links'
	it 'should check tree status'
	it 'should setup'

	it 'should execute a link', (done)->
		e = new Executor
		node = _instance : execute : (data)->
			data.should.equal 'sample-data'
			done()
		e._executeLink node, 'sample-data'

	
	it 'should add data to buckets', (done)->
		e = new Executor
		node = _bucket: addContent: (data) ->
			data.should.equal 'sample-data'
			done()
		e._addBucketContent node, 'sample-data'



	it 'should check if its a leaf', ->
		e = new Executor
		node = links : []
		e._isntLeaf(node).should.equal false
		node = links : [1..5]
		e._isntLeaf(node).should.equal true


	it 'should add to Persistent Data if req', (done)->
		root =
			links: []
			_instance: setup :->
			_bucket: addContent: (name, data) ->
								data.should.equal 'sample-data'
								name.should.equal 'sample-name'
								done()
		
		e  = new Executor root
		e._setupPersistentBucket()
		e._addPersistentData 'sample-data', 'sample-name'

	it 'should not add to Persistent Data',->
		called = 0
		root = 
			_bucket: addContent: -> called++
			_instance: setup: ->
		e  = new Executor root
		e._addPersistentData 'sample-data' #, no-name
		called.should.equal 0

