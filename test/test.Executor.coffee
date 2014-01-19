
Executor = require '../src/Executor'
describe "Executor", ->

	it 'should setup count', ->
		e = new Executor
		e.rCount.value.should.equal(0)

	it 'should check if the node can be executed', ->
		nodeOperation = canExecuteChildren:-> false
		e = new Executor null, null, nodeOperation
		e._canExecute({}).should.equal false


	it 'should execute a link', (done)->
		e = new Executor
		node = _instance : execute : (data)->
			data.should.equal 'sample-data'
			done()
		e._executeLink node, 'sample-data'
	

	it 'should add to Persistent Data',->
		e  = new Executor null, root, null, addContent: (name, data) -> name+'-'+data
		e._addPersistentData('sample-data', 'sample-name')
		.should.equal 'sample-name-sample-data'

	it 'should not add to Persistent Data',->
		called = 0
		root = tree:
			_bucket: addContent: -> called++
			_instance: setup: ->
		e  = new Executor root
		e._addPersistentData 'sample-data' #, no-name
		called.should.equal 0