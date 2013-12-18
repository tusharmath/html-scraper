###
	chain - Http, Select, Extract, Http
###





	scraper = new Scraper(new Executor)
	scraper('url')
		#Piped url as param
		.http() #Document containing a table of fav movies
		.select 'div.movies'
		.extract 'user-data', ($) -> #DOCUMENT is piped
			'key-1': $('cssSelector_1').attr 'data-bind'
			'key-2': $('cssSelector_2').attr 'href'
			'key-3': $('cssSelector_3').val()
		.http 'key-2'
		.select 'body'
		.extract 'output-data', ($, data) ->
			'key-a': $('cssSelector_a').attr 'data-bind'
			'key-b': data['key-1']
		.execute 
