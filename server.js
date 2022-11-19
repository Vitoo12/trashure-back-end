/* eslint-disable no-console */
const express = require('express');
require('dotenv').config();
const userRoutes = require('./routes/userRoutes');

const app = express();

// menggunakan ejs template engine
app.set('view engine', 'ejs');

// parsing body request
app.use(express.json());

// routing
app.use('/register', userRoutes);

// starting server
const PORT = process.env.PORT || 5000;
app.listen(PORT, console.log(`server running in ${process.env.NODE_ENV} mode port ${PORT}`));
