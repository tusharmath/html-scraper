require ("coffee-trace")

ExecutionTree = require './ExecutionTree'
Executor = require './Executor'
Pipe = require './DataPipe'
ExecutorFactory = require './ExecutorFactory'

#Build Services Map
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

		#Initialize an Executor
		fac = new ExecutorFactory executables

		#Initialize Executor
		exe = new Executor fac, @chain, pipe

		#Execute the tree
		exe.execute callback

module.exports = Scraper