var fs = require('fs');

var fileOptions = {
	encoding: 'utf8'
};

var writer = function(file) {
	this.file = file;

};

var write = function(callback, data) {
	data = JSON.stringify(data);
	fs.writeFile(this.file, data, fileOptions, callback);
};

var read = function(callback) {
	fs.readFile(this.file, fileOptions, function(err, data) {
		if (data === undefined) {
			callback([]);
		} else {
			callback(JSON.parse(data));
		}
	});
};


writer.prototype.execute = function(callback, data) {

	var self = this;
	read.call(this, function(readData) {
		Array.prototype.push.apply(readData, data);
		write.call(self, callback, readData);
	});

};

module.exports = writer;