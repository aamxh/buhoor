const express = require('express');
const router = express.Router();
const { getFilteredPoems } = require('../controllers/poems_controller');

router.get('/', getFilteredPoems);

module.exports = router;