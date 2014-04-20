request = require 'request'
RSVP = require 'rsvp'

m = {}
m.http_method = (key) ->
m.select_method = (key) ->
m.scrape_method = (key) ->

attach_methods = (obj) ->
    obj.http = m.http_method
    obj.select = -> m.select_method
    obj.scrape = -> m.scrape_method
    obj
scraper = (params) -> attach_methods RSVP.resolve params


scraper({url: 'http://tusharm.com'}).http('url')


module.exports = scraper