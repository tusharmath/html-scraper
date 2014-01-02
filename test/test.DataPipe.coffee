should = require 'should'
DataPipe = require '../src/DataPipe'
describe "DataPipe", ->

	it 'should add nodata', ->
		d = new DataPipe
		d.hasData().should.be.false

	it 'should add data', ->
		d = new DataPipe 43
		d.hasData().should.be.true

	it 'should return complete object if not name is passed', ->
		d = new DataPipe
		d.addPersistentData 'gobi', 'sample-data'
		d.getPersistentData().should.be.eql 'gobi': ['sample-data']

	it 'should save content as array', ->
		d = new DataPipe
		d.addPersistentData 'allu'
		d.getPersistentData('allu').should.be.an.instanceof Array

	it 'should save transient data', ->
		d = new DataPipe 'transient-data'
		d.getTransientData().should.equal 'transient-data'

	it 'should persist data', ->
		d = new DataPipe
		d.addPersistentData 'persistent-data-1', 'xxx'
		d.addPersistentData 'persistent-data-2', {}
		d1 = d.create 'transient-data'

		d1.should.be.an.instanceOf DataPipe
		(d1.getPersistentData 'persistent-data-1').should.eql ['xxx']
		

	it 'should add Extractions', ->
		d = new DataPipe
		obj = {x:1}
		d.addPersistentData 'alpha', obj
		d.getPersistentData('alpha').should.eql [obj]
