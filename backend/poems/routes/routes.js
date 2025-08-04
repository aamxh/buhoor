const express = require('express');
const router = express.Router();
const { getFilteredPoems } = require('../controllers/controller');

router.get('/', getFilteredPoems);

module.exports = router;