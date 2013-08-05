var should = require('should');
var _ = require('underscore');
var u = require('../lib/utils');
var mocked = require('./mocked');

var dataParse;

describe('ParseDataTask', function() {


	before(function() {

		mocked.enable({
			warnOnUnregistered: false
		});

		dataParse = require('../lib/parseDataTask');
	});

	after(function() {
		mocked.disable();
	});

	it('should parse', function() {

		var callback = function(err, result) {
			result[0].k1.should.eql(['XX XX XXXX X XXXXXXX']);
		};

		u.executor(dataParse)(callback, [{
			k1: [1],
			k2: [2]
		}, {
			k1: [1],
			k2: [2]
		}, {
			k1: [1],
			k2: [2]
		}, {
			k1: [1],
			k2: [2]
		}, {
			k1: [1],
			k2: [2]
		}]);

	});

});