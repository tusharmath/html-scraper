//UNIVERSALS
var a = require('async');
var $ = require('jQuery');
var u = require('./Utils');

var parseDataTask = require('./parseDataTask');
var selectDataElementTask = require('./selectDataElementTask');
var selectDataNodeTask = require('./selectDataNodeTask');
var webRequestTask = require('./webRequestTask');
var writerTask = require('./writerTask');


var scraper = function(file) {

	this.file = file;

	this.executors = {};


	this.executors.parseData = u.executor(parseDataTask);
	this.executors.selectDataElement = u.executor(selectDataElementTask);
	this.executors.selectDataNode = u.executor(selectDataNodeTask);
	this.executors.webRequest = u.executor(webRequestTask);
	this.executors.writer = u.executor(writerTask, this.file);

};

scraper.prototype.execute = function(url, parseKey, callback) {

	var e = this.executors;
	a.waterfall([

	function(callback) {
		e.webRequest(callback, url);
	},

	function(result, callback) {
		e.selectDataNode(callback, result, parseKey);
	},

	function(result, callback) {
		e.selectDataElement(callback, result, parseKey);
	},

	function(result, callback) {
		e.parseData(callback, result);
	},

	function(result, callback) {
		e.writer(callback, result);
	}

	], callback);
};

module.exports = scraper;
