const mysql = require('mysql2/promise');
require('dotenv').config()
const pool = mysql.createPool({
<<<<<<< HEAD
    host: '127.0.0.1',  // Sử dụng localhost hoặc 127.0.0.1
    user: 'root',       // Đúng với thông tin trong Workbench
    password: 'root',       // Kiểm tra nếu MySQL không có mật khẩu
    database: 'G5_Customer',
    port: 3307,         // Đổi port thành 3307 như trong Docker
=======
    host:process.env.DATABASE_HOST,
    user:process.env.DATABASE_USER,
    password:process.env.DATABASE_PASSWORD,
    database:process.env.DATABASE_NAME,
    port :3306,
>>>>>>> 54631f00d9c2dc825334f80b0a885039eea58f6b
    connectTimeout: 50000
});

module.exports = pool;
