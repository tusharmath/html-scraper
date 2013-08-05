var should = require('should');
var _ = require('underscore');
var u = require('../lib/utils');
var mocked = require('./mocked');

var writer;

describe('SelectDataElementTask', function() {

	before(function() {
		mocked.enable({
			warnOnUnregistered: false
		});

		writer = require('../lib/writerTask');
	});

	after(function() {
		mocked.disable();
	});

	it('should work with empty files', function() {
		var callback = function(err, result) {

			JSON.parse(result).should.eql(['D', 'E', 'F']);
		};

		u.executor(writer, 'emptyfile')(callback, ['D', 'E', 'F']);

	});

	it('should work with already present file files', function() {
		var callback = function(err, result) {

			JSON.parse(result).should.eql(['A', 'B', 'C', 'D', 'E', 'F']);
		};

		u.executor(writer, 'dumpy')(callback, ['D', 'E', 'F']);

	});

});