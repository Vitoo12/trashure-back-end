const express = require('express');
const router = express.Router();

router.route('/').get("hello ini get").post('hello ini post');

router.route('/register').post('halo ini post register');

router.route('/login').get('halo ini get user');

module.exports = router;

