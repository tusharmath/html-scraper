var mockery = require('mockery');
mockery.registerMock('jQuery', function(document) {
	return {
		find: function(selector) {
			return document.indexOf(selector);
		},
		text: function() {
			return '  XX    XX    XXXX X XXXXXXX   ';
		}
	};
});

mockery.registerMock('fs', {
	writeFile: function(file, data, options, callback) {
		callback(null, data);
	},
	readFile: function(file, options, callback) {
		if (file === 'emptyfile') {
			callback();
		} else {
			callback(null, JSON.stringify(['A', 'B', 'C']));
		}
	}
});

module.exports = mockery;