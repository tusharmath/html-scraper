//exports.area
//modules.exports
var http = require('http');

var webRequest = function() {

};

webRequest.prototype.execute = function(callback, url) {

	this.url = url;
	http.get(this.url, function(resp) {
		resp.setEncoding('utf8');
		var data = '';
		resp.on('data', function(chunk) {
			data += chunk;
		});

		resp.on('end', function() {
			callback(null, data);
		});
	});
};

module.exports = webRequest;