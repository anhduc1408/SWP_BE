const { Sequelize } = require('sequelize');

const sequelize = new Sequelize("G5_Customer", "tienanhbui", "", {
    host: "34.56.84.253",
    dialect: "mysql",
    port: 3306
})
module.exports = pool;