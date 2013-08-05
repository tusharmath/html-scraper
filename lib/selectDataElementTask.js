var $ = require('jQuery');
var _ = require('underscore');

var dataParser = function() {};

var parse = function(dataNode, parseKey) {

	var result = {};
	_.each(parseKey, function(value, key) {
		var elements = $(dataNode).find(value);
		if (value instanceof Array) {
			result[key] = elements;
		} else {
			result[key] = elements[0];
		}
	});
	return result;

};

dataParser.prototype.execute = function(callback, dataNodes, parseKey) {
	var result = [];
	_.each(dataNodes, function(dataNode) {
		result.push(parse(dataNode, parseKey[Object.keys(parseKey)[0]]));
	});
	callback(null, result);
};

module.exports = dataParser;