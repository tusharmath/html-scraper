class Scraper
	constructor: (@path, @executor) ->
		_private = {}

		#Defines a standard function
		_private.defineFunction = (name) =>
			@[name] = -> @executor.register name, arguments
			@[name] = name
			@
		_private.defineFunction 'http'
		_private.defineFunction 'split'
		_private.defineFunction 'extract'

	scrape: (callback) -> @executor.execute callback

module.exports = Scraper