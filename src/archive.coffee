request = require 'superagent'

# Archive
class Archive
  # get
  #
  # @param  {string}   path
  # @param  {object}   query
  # @param  {function} callback err, response
  # @return {Archive} this
  get: (path, query, cb) ->
    cb = arguments[arguments.length - 1]

    request.get("http://archive.org/#{path}")
      .query(output: 'json')
      .query(query unless typeof query is 'function')
      .end (res) ->
        console.log res.body
        cb res.body
    @

  # http://archive.org/advancedsearch.php?type
  #
  # @param  {function} callback err, response
  # @return {Archive} this
  search: (params, cb) ->
    @get 'advancedsearch.php', params, (response) ->
      cb null, response

  v: -> '0.0.1'

module.exports = new Archive()
