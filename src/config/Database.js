const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host:'localhost',
    user:'root',
    password:'root',
    database:'G5_Customer',
    port :3306,
    connectTimeout: 50000
})
module.exports = pool;