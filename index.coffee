request = require 'request'
cheerio = require 'cheerio'
{Chain} = require 'chaining-tatum'
Q = require 'q'
proto =
    http: (keyName, data) ->
            defer = Q.defer()
            request data[keyName], (err, res, body) ->
                return defer.reject(err) if err
                defer.resolve cheerio.load body
            defer.promise
    split: (selector, $) ->
            eles = []
            $ selector
            .each (i, e) -> eles.push $ e
            eles
    extract: (callback, data) ->
            callback data


module.exports = -> new Chain proto
