/* eslint-disable consistent-return */
const crypto = require('crypto');
const User = require('../models/userModel');

const getHashedPassword = (password) => {
  const sha256 = crypto.createHash('sha256');
  const hash = sha256.update(password).digest('base64');
  return hash;
};

module.exports = {
  // @desc me redirect ke halaman form untuk  register
  formRegister(req, res) {
    // res.sendFile('form.html', { root: 'views' });
    res.render('form');
  },
  // @desc menambahkan data user ke database
  async createUser(req, res) {
    try {
      const hashedPassword = getHashedPassword(req.body.password);
      const user = await User.create({
        name: req.body.name,
        password: hashedPassword,
        email: req.body.email,
        number: req.body.number,
        nik: req.body.nik,
      });
      res.status(200).json({
        succes: true,
        message: 'berhasil menambahkan data mahasiswa',
        data: user,
      });
    } catch (err) {
      res.status(400).json({
        succes: false,
        message: err.message,
      });
    }
  },
  // @desc mengambil seluruh data user
  async getAllUsers(req, res) {
    try {
      const user = await User.findAll();

      res.status(200).json({
        succes: true,
        message: 'melihat seluruh data mahasiswa',
        data: user,
      });
    } catch {
      res.status(500).json({
        succes: false,
        message: 'something went wrong',
      });
    }
  },
  // @desc melihat data satu user
  async getUser(req, res) {
    try {
      const user = await User.findByPk(req.params.id);

      if (!user) {
        return res.status(404).json({
          succes: false,
          message: 'data mahasiswa tidak ditemukan',
        });
      }

      res.status(200).json({
        succes: true,
        message: `melihat data mahasiswa ke-${req.params.id}`,
        data: user,
      });
    } catch (err) {
      res.status(400).json({
        succes: false,
        message: err.message,
      });
    }
  },
  // @desc memhapus data user
  async deleteUser(req, res) {
    try {
      const user = await User.findByPk(req.params.id);

      if (!user) {
        return res.status(404).json({
          succes: false,
          message: 'data user tidak ditemukan',
        });
      }

      await user.destroy();

      res.status(200).json({
        succes: true,
        message: 'data userberhasil terhapus',
      });
    } catch (err) {
      res.status(400).json({
        succes: false,
        message: err.message,
      });
    }
  },
  // @desc me redirect ke halaman form untuk  register
  formLogin(req, res) {
    res.render('login');
  },
  // @desc memhapus data user
  async loginUser(req, res) {
    try {
      const { email, password } = req.body;
      const hashedPassword = getHashedPassword(password);

      const user = await User.findOne({
        where: {
          email,
          password: hashedPassword,
        },
      });
      if (!user) {
        res.status(402).json({
          success: false,
          message: 'email atau password anda salah',
        });
      } else {
        res.status(200).json({
          success: true,
          message: 'Anda berhasil login',
          data: user,
        });
      }
    } catch {
      res.status(500).json({
        succes: false,
        message: 'something went wrong',
      });
    }
  },
};
