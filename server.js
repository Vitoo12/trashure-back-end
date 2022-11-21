const express = require('express');
const sequelize = require('./utils/database');
const organikRoutes = require('./routes/organikRoutes');
const anorganikRoutes = require('./routes/anorganikRoutes');
const tipsRoutes = require('./routes/tipsRoutes')

require('dotenv').config()
require('./models/index');

const app = express();

// Function middleware untuk mengubah seluruh data req menjadi json
app.use(express.json());

// API untuk mengembalikan data sampah anorganik
app.use('/anorganik', anorganikRoutes);

// API untuk mengembalikan data sampah organik
app.use('/organik', organikRoutes);

// API untuk mengembalikan data tips
app.use('/tips', tipsRoutes);

const PORT = process.env.PORT

sequelize.authenticate().then(() => {
  sequelize.sync().then(() => {
    console.log('Database berhasil terhubung')
    app.listen(PORT, () => {
      console.log(`server sedang berjalan di ${process.env.NODE_ENV} pada port ${PORT}`)
    })
  })
}).catch(() => console.log(`Database gagal disambungkan`))
