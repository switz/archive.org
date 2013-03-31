archive.org
========

npm module for the subsonic api

[![build status](https://secure.travis-ci.org/switz/archive.org.png)](http://travis-ci.org/switz/archive.org)

### Install

```
$ npm install archive.org --save
```

### Docs
[Documentation](http://saewitz.com/subsonic/doc/classes/Archive.html)

### Example

```javascript
Archive = require('archive.org');
archive = new Archive();

archive.search({q: 'Grateful Dead'}, function(err, res) {
  console.log(res);
});
```
