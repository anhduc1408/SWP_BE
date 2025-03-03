const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: '127.0.0.1',  // Sử dụng localhost hoặc 127.0.0.1
    user: 'root',       // Đúng với thông tin trong Workbench
    password: 'root',       // Kiểm tra nếu MySQL không có mật khẩu
    database: 'G5_Customer',
    port: 3307,   
    connectTimeout: 50000
});

module.exports = pool;
