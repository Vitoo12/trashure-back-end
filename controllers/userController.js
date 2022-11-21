const crypto = require('crypto');
const User = require('../models/userModel');

const getHashedPassword = (password) => {
  const sha256 = crypto.createHash('sha256');
  const hash = sha256.update(password).digest('base64');
  return hash;
};

module.exports = {

  formRegister(req, res) {
    // res.sendFile('form.html', { root: 'views' });
    res.render('form');
  },
  async createUser(req, res) {
    try {
      const hashedPassword = getHashedPassword(req.body.password);
      const student = await User.create({
        name: req.body.name,
        password: hashedPassword,
        email: req.body.email,
        number: req.body.number,
        nik: req.body.nik,
      });
      res.status(200).json({
        succes: true,
        message: 'berhasil menambahkan data mahasiswa',
        data: student,
      });
    } catch (err) {
      res.status(400).json({
        succes: false,
        message: err.message,
      });
    }
  },
};
