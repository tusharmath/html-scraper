var _ = require('underscore');
var $ = require('jQuery');

var dataParser = function() {};

var cleanContent = function(item) {
	return item.replace(/^\s+|\s+$|\s+(?=\s)/g, '');
};

var getText = function(items) {
	var result = [];
	_.each(items, function(item) {
		var text = $(item).text();
		text = cleanContent(text);
		result.push(text);
	});
	return result;
};

var parse = function(dataItem) {
	var result = [];
	_.each(dataItem, function(values) {
		item = {};
		_.each(values, function(value, key) {
			item[key] = getText(value);
		});

		result.push(item);
	});
	return result;

};

dataParser.prototype.execute = function(callback, dataItem) {
	var result = parse(dataItem);
	callback(null, result);
};

module.exports = dataParser;