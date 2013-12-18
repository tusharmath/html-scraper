require ("coffee-trace")

ExecutionTree = require './ExecutionTree'
Executor = require './Executor'
Pipe = require './DataPipe'
ExecutorFactory = require './ExecutorFactory'

#Include Services
executables =
	'select' : require './SelectService'
	'extract' : require './ExtractService'
	'http' : require './HttpService'


class Scraper
	constructor: (data) ->
		#Create an exection tree
		@chain = new ExecutionTree
		@chain.setup ['http', 'select', 'extract']

	execute: (callback) ->

		fac = new ExecutorFactory executables
		exe = new Executor fac, @chain
		exe.execute callback

module.exports = Scraper

#Sample Usage
$ = new Scraper url: 'http://http://tusharm.com/'


$.chain
.http('url')
.select('.intro')
.extract('titles', (doc)-> console.log doc)

$.execute (result) -> console.log result