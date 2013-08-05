var scrapper = require('../lib/taskExecuter');

var page = 0;
var url = 'http://grad-schools.usnews.rankingsandreviews.com/best-graduate-schools/top-engineering-schools/computer-engineering-rankings/page+1';

var scrap = new scrapper('/Users/tusharmathur/Desktop/Temp/output.json');

scrap.execute(url, {
	'table.ranking-data tbody tr': {
		'rank': 'td:nth-child(1) span span',
		'school-name': 'td:nth-child(2) > a',
		'score': 'td:nth-child(3)',
		'tuition': 'td:nth-child(4)',
		'enrollment': 'td:nth-child(5)'

	}
}, function() {
	console.log('done');
});