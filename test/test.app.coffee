describe 'Modules', ->
    it 'executor should exist', ->
        (require('../src/Executor')).should.not.throw

describe 'Scraper', ->
    scraper = {}

    hasProperties = (obj, property_list)->
        for i in property_list
            obj.should.have.property i


    beforeEach ->
        scraper = require '../src/Executor'


    describe 'http()', ->
        it 'should exist', ->
            should.exist scraper({}).http

        it 'should be thenable', ->
            should.exist scraper({}).http({}).then

        it 'should have http, select, extract attached', ->
            hasProperties scraper({}).http({}), 
            ['http', 'select', 'extract']