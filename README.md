archive.org
========

npm module for the subsonic api

[![build status](https://secure.travis-ci.org/switz/archive.org.png)](http://travis-ci.org/switz/archive.org)

### Install

```
$ npm install archive.org --save
```

### Docs
[Documentation](http://saewitz.com/archive.org/doc/classes/Archive.html)

### Example

```javascript
var archive = require('archive.org');

archive.search({q: 'Grateful Dead'}, function(err, res) {
  console.log(res);
});
```

