describe 'Module', ->
    it 'should exist', ->
        (require('../src/Executor')).should.not.throw

describe 'Scraper', ->
    scraper = {}
    beforeEach ->
        scraper = require '../src/Executor'


    describe 'http()', ->
        it 'should exist', -> should.exist scraper.http
