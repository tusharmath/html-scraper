var should = require('should');
var _ = require('underscore');
var u = require('../lib/utils');
var mocked = require('./mocked');

var selectDataNode;

describe('SelectDataNodeTask', function() {

	before(function() {

		mocked.enable({
			warnOnUnregistered: false
		});

		selectDataNode = require('../lib/selectDataNodeTask');
	});

	after(function() {
		mocked.disable();
	});

	it('should select data node', function() {
		var callback = function(err, result) {

			result.should.equal(3);
		};
		u.executor(selectDataNode)(callback, 'AA BB CC DD', {
			'BB': {
				'k1': 'AA',
				'k2': 'BB'
			}
		});

	});

});