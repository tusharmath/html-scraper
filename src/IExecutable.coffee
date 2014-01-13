class IExecutable
	#TODO: Callback needs to be removed
	execute: (data, callback) -> @run callback, data
	
	#Setup common properties
	setup: (@totalRunningCount, @persistentBucket, @onResponse) -> 
		@running = 0
		
	doing: () ->
		@running++
		@totalRunningCount.value++
	
	done: () ->
		@running--
		@totalRunningCount.value--




module.exports = IExecutable