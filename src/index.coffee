require ("coffee-trace")

ExecutionTree = require './ExecutionTree'
Executor = require './Executor'
Pipe = require './DataPipe'
TreeFactory = require './TreeFactory'

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
	
		#Initialize Tree Factory & Setup
		treeFac = new TreeFactory executables
		nodeCount = treeFac.setup @start

		#Initialize Executor
		exe = new Executor @start, pipe

		#Execute the tree
		exe.execute (response)->
			callback response if nodeCount-- is 0

module.exports = Scraper