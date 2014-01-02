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
	'stop' :  require './ExecutionStopper'

class Scraper
	constructor: (@startup) ->
		#Create an exection tree
		@start = new ExecutionTree
		@start.setup ['http', 'split', 'extract', 'stop']

	execute: (callback) ->
		pipe = new Pipe @startup
	
		#Initialize an Executor
		fac = new ExecutorFactory executables

		#Initialize Executor
		exe = new Executor fac, @start, pipe

		#Execute the tree
		exe.execute()

module.exports = Scraper