const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host:'34.56.84.253',
    user:'vietdd',
    password:'123321',
    database:'G5_Customer',
    port :3306,
    connectTimeout: 10000
})
module.exports = pool;