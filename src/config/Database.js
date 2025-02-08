const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host:'34.56.84.253',
    user:'anhduc',
    password:'anhduc1408',
    database:'G5_Customer',
    port :3306
})
module.exports = pool;