const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host:'127.0.0.1',
    user:'root',
    password:'123456',
    database:'G5_Customer',
    port :3306
})
module.exports = pool;