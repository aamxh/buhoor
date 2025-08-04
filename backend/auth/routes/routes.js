const express = require('express');
const router = express.Router();
const {register, login, profile} = require('../controllers/controller');
const authenticateToken = require('../middleware/middleware');

router.post('/register', register);
router.post('/login', login);
router.get('/profile', authenticateToken, profile);

module.exports = router;