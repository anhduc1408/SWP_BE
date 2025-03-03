const mysql = require('mysql2/promise');

const pool = mysql.createPool({

    host: '127.0.0.1',
    user: 'root',
    password: '123',
    database: 'G5_Customer',
    port: 3306,
    // =======
    //     host: '127.0.0.1',  // Sử dụng localhost hoặc 127.0.0.1
    //     user: 'root',       // Đúng với thông tin trong Workbench
    //     password: 'root',       // Kiểm tra nếu MySQL không có mật khẩu
    //     database: 'G5_Customer',
    //     port: 3307,    
    //     host:process.env.DATABASE_HOST,
    //     user:process.env.DATABASE_USER,
    //     password:process.env.DATABASE_PASSWORD,
    //     database:process.env.DATABASE_NAME,
    //     port :3306,
    // >>>>>>> 5d46ff1d1567bb2a8b6006ec8dd595133006af63
    connectTimeout: 50000
});

module.exports = pool;
