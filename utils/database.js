const { Sequelize } = require('sequelize');
require('dotenv').config();

const { DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASSWORD } = process.env;

const sequelize = new Sequelize(DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASSWORD, {
  dialect: 'mysql',
  host: 'localhost',
  timezone: '+07:00',
});

module.exports = sequelize;
