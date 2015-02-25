#HTML Scraper
The scraper has **three** components: `http` → `split` → `extract`, executed in the same order. You make an `http` request to fetch a page, `split` the page into different sections and ultimately `extract` the data from each section using a custom parser.

The best part about this scraper is that you can create a chain of actions that you need to perform.

###Order of execution
`http` → `split` → `extract` → `http` → `split` and so on…

###Example
Say I  want extract al the information of students who got admitted to the University of Southern California, Los Angeles. I would do it as follows —

1. Make an http request to this page —
	[http://edulix.com/universityfinder/university_of_southern_california](http://edulix.com/universityfinder/university_of_southern_california). 
2. Page consists of multiple anchor tags containing links of each





```coffeescript
	
	#Pass the url to the initialiser
	$ = new Scraper url: 'http://tusharm.com'
	
	
	#All the methods are available in the chain object
	$.chain
	.http('url') #Pass
	.split('.intro')
	.extract('titles', (doc)->
		anchor = doc.find '.intro h2 a'
		href: 'http://tusharm.com' + anchor.attr('href')
		title: anchor.text()
	).http('href')
	.split('body')
	.extract('content', (doc)->
		data: doc.find('p').text()
		)
	
	
	$.execute (result) -> console.log result
```


#Running tests
```sh
mocha --watch --reporter=min
```
