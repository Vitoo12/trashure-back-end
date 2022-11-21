// const { Router } = require('express');
const express = require('express');

const router = express.Router();
const {
  formRegister,
  createUser,
} = require('../controllers/userController');

router.route('/').get(formRegister).post(createUser);

module.exports = router;
