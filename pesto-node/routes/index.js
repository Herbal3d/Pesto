// Copyright (c) 2016, Robert Adams
// Licensed under BSD 3-Clause license. See accompanying LICENSE file.

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
