const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("G5_Customer", "anhduc", "anhduc1408", {
    host: "34.56.84.253",  
    dialect: "mysql",   
    logging: false    
});

module.exports = sequelize;