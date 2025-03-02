const mysql = require('mysql2/promise');
require('dotenv').config()
const pool = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: '123',
    database: 'G5_Customer',
    port: 3306,
    connectTimeout: 50000
})
module.exports = pool;