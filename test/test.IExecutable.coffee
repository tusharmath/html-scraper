
IExecutable = require '../src/IExecutable'
describe "IExecutable", ->

	it 'should setup', ->
		e = new IExecutable
		e.setup value: 100, 'persistentBucket-sample', 'onResponse-sample'
		e.totalRunningCount.value.should.equal 100
		e.persistentBucket.should.equal 'persistentBucket-sample'
		e.onResponse.should.equal 'onResponse-sample'

	it 'should be doing stuff', ->
		e = new IExecutable
		e.setup value:100
		e.doing()
		e.running.should.equal 1
		e.totalRunningCount.value.should.equal 101

	it 'should stop doing stuff', ->
		e = new IExecutable
		e.setup value:100
		e.done()
		e.running.should.equal -1
		e.totalRunningCount.value.should.equal 99
	
	