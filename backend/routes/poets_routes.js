const express = require('express');
const router = express.Router();
const {getPoets} = require('../controllers/poets_controller');

router.get('/', getPoets);

module.exports = router;