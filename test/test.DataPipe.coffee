should = require 'should'
DataPipe = require '../src/DataPipe'
describe "DataPipe", ->
	
	it 'should save transient data', ->
		d = new DataPipe 'transient-data'
		d.getTransientData().should.equal 'transient-data'

	it 'should persist data', ->
		d = new DataPipe
		d.addPersistentData 'persistent-data-1', 'xxx'
		d.addPersistentData 'persistent-data-2', {}
		d1 = d.newPipeData 'transient-data'

		d1.should.be.an.instanceOf DataPipe
		(d1.getPersistentData 'persistent-data-1').should.equal 'xxx'
		

	it 'should add Extractions', ->
		d = new DataPipe
		obj = {}
		d.addPersistentData 'alpha', obj
		(d.getPersistentData 'alpha').should.equal obj
