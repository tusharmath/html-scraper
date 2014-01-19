
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

	it 'should set common params for all', ->
		recursiveCaller = execute : (x,y) -> y
		e = new Executor recursiveCaller
		e._setupCommonParams('aa').should.equal 'aa'


	it 'should set [rCount] [perBucket] and default [onResponse] callback', ->
		e = new Executor
		node = _instance: setup : (a,b,c)-> {a,b,c}
		e.rCount = 'rCount-override'
		e.perBucket = 'persistentbucket-override'
		e._onResponse = -> 'onResponse-override'
		result = e._commonParams(node)
		result.a.should.equal 'rCount-override'
		result.b.should.equal 'persistentbucket-override'
		result.c().should.equal 'onResponse-override'


	it 'should '
	it 'should update count'
	it 'should execute all links'
	it 'should check tree status'


	

	it 'should check if the node can be executed', ->
		e = new Executor
		e._isntLeaf = -> true
		e._canExecuteChildren(_bucket:isntEmpty: -> true).should.equal true
		e._canExecuteChildren(_bucket:isntEmpty: -> false).should.equal false
		e._isntLeaf = -> false
		e._canExecuteChildren(_bucket:isntEmpty: -> true).should.equal false


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
			tree :
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
		root = tree:
			_bucket: addContent: -> called++
			_instance: setup: ->
		e  = new Executor root
		e._addPersistentData 'sample-data' #, no-name
		called.should.equal 0

