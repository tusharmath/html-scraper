request = require 'request'
RSVP = require 'rsvp'

m = {}
m.http_method = (key) ->
    promise = new RSVP.Promise (resolve, reject) ->
    attach_methods promise


m.select_method = (key) ->
m.extract_method = (key) ->

attach_methods = (obj) ->
    obj.http = m.http_method
    obj.select = -> m.select_method
    obj.extract = -> m.extract_method
    obj
scraper = (params) -> attach_methods RSVP.resolve params


scraper({url: 'http://tusharm.com'}).http('url')


module.exports = scraper