// const { Router } = require('express');
const express = require('express');

const router = express.Router();
const {
  formRegister,
  createUser,
  formLogin,
  loginUser,
  getAllUsers,
  getUser,
  deleteUser,
  updateUser,
} = require('../controllers/userController');

router.route('/').get(formRegister).post(createUser);
router.route('/login').get(formLogin).post(loginUser);
router.route('/allusers').get(getAllUsers);
router.route('/:id').get(getUser).put(updateUser).delete(deleteUser);

module.exports = router;
