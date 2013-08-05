var should = require('should');
var _ = require('underscore');
var u = require('../lib/utils');
var mocked = require('./mocked');

var dataParse;

describe('SelectDataElementTask', function() {

	before(function() {
		mocked.enable({
			warnOnUnregistered: false
		});

		dataParse = require('../lib/selectDataElementTask');
	});

	after(function() {
		mocked.disable();
	});

	it('should select data elements', function() {
		var callback = function(err, result) {

			result.should.eql([{
							'k1': 4,
							'k2': 2
						}]);
		};
		u.executor(dataParse)(callback, ['AABBCCDD'], {
			'x': {

				'k1': 'CC',
				'k2': 'BB'

			}
		});

	});

});