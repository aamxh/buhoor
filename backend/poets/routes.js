const express = require('express');
const router = express.Router();
const {getPoets} = require('./controller');

router.get('/', getPoets);

module.exports = router;