const express = require('express');
const AuthController = require('../app/controller/AuthController');
const router = express.Router();

router.post('/register', async (req, res) => {
    AuthController.register(req, res);
});

router.post('/login', async (req, res) => {
    AuthController.login(req, res);
});

module.exports = router;