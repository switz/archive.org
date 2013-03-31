request = require 'superagent'

# Archive
class Archive
  # get
  #
  # @param  {string}   path
  # @param  {object}   query
  # @param  {function} callback err, response
  # @return {Archive} this
  get: (path, params, cb) ->
    cb = arguments[arguments.length - 1]

    request.get("http://archive.org/#{path}")
      .query(output: 'json')
      .query(params unless typeof params is 'function')
      .end (res) ->
        cb res.body
    @

  # http://archive.org/advancedsearch.php
  #
  # @param  {function} callback err, res
  # @return {Archive} this
  search: (params, cb) ->
    @get 'advancedsearch.php', params, (res) ->
      cb null, res

  # http://archive.org/details/item
  #
  # @param  {function} callback err, res
  # @return {Archive} this
  item: (item, params, cb) ->
    cb = arguments[arguments.length - 1]
    @get 'details/' + item, params, (res) ->
      cb null, res

  v: -> '0.0.1'

module.exports = new Archive()
