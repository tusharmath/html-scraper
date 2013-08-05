var $ = require('jQuery');
var selectDataItem = function() {};

selectDataItem.prototype.execute = function(callback, document, parsekey) {
	var nodeSelector = Object.keys(parsekey)[0];
	var nodes = $(document).find(nodeSelector);
	callback(null, nodes);
};

module.exports = selectDataItem;