// const { Router } = require('express');
const express = require('express');

const router = express.Router();
const {
  formLogin,
  loginUser,
} = require('../controllers/userController');

router.route('/').get(formLogin).post(loginUser);

module.exports = router;
