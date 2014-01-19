
NodeOperations = require '../src/NodeOperations'
describe "NodeOperations", ->
	
	it 'should check if its a leaf', ->
		e = new NodeOperations
		node = links : []
		e.isntLeaf(node).should.equal false
		node = links : [1..5]
		e.isntLeaf(node).should.equal true


	it 'should add data to buckets', (done)->
		e = new NodeOperations
		node = _bucket: addContent: (data) ->
			data.should.equal 'sample-data'
			done()
		e.addBucketContent node, 'sample-data'


	it 'should check if the node -> children can be executed', ->
		e = new NodeOperations
		e.isntLeaf = -> true
		e.canExecuteChildren(_bucket:isntEmpty: -> true).should.equal true
		e.canExecuteChildren(_bucket:isntEmpty: -> false).should.equal false
		e.isntLeaf = -> false
		e.canExecuteChildren(_bucket:isntEmpty: -> true).should.equal false


	it 'should set executor params', ->
		n = new NodeOperations
		node = _instance: setup : (a,b,c)-> {a,b,c}
		e = {}
		e.rCount = 'rCount-override'
		e.perstBucket = 'persistentbucket-override'
		e._onResponse = -> 'onResponse-override'
		result = n.setExecutorParams(node, e)

		result.a.should.equal 'rCount-override'
		result.b.should.equal 'persistentbucket-override'
		result.c().should.equal 'onResponse-override'
