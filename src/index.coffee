require ("coffee-trace")

ExecutionTree = require './ExecutionTree'
Executor = require './Executor'
Pipe = require './DataPipe'
ExecutorFactory = require './ExecutorFactory'

#Include Services
executables =
	'split' : require './SplitService'
	'extract' : require './ExtractService'
	'http' : require './HttpService'


class Scraper
	constructor: (@startup) ->
		#Create an exection tree
		@chain = new ExecutionTree
		@chain.setup ['http', 'split', 'extract']

	execute: (callback) ->
		pipe = new Pipe @startup
		fac = new ExecutorFactory executables
		exe = new Executor fac, @chain, pipe
		exe.execute callback

module.exports = Scraper