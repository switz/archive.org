request = require 'superagent'
expect = require 'expect.js'
require 'coffee-script'

## monkey-patch expect.js for better diffs on mocha
## see: https://github.com/LearnBoost/expect.js/pull/34

origBe = expect.Assertion::be
expect.Assertion::be = expect.Assertion::equal = (obj) ->
  @_expected = obj
  origBe.call this, obj

### archive ###
archive = require '../src/archive'

### Specs ###

describe 'API', ->
  describe 'With proper parameters', ->

    it 'search', (done) ->
      archive.search
        q: 'grateful dead'
      , (err, res) ->
        expect(err).to.be null
        expect(res.responseHeader.status).to.be 0
        expect(res.response.numFound).to.be.above 14519
        expect(res.response.docs.length).to.be 20
        done()

