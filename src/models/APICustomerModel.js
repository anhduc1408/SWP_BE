const pool = require("../config/Database");

exports.addCustomer = async (data) => {
    try {
        // Kiểm tra nếu CustomerID đã tồn tại
        const check = await pool.query('SELECT * FROM Customer WHERE CustomerID = ?', [data.CustomerID]);
        console.log(data.CustomerID);

        if (check.length === 0) {
            // Thêm khách hàng mới vào database
            await pool.query(`
                INSERT INTO Customer (CustomerID, Email, PhoneNumber, FirstName, LastName, DateOfBirth, Gender, Status, CreatedAt) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [data.CustomerID, data.Email, data.PhoneNumber, data.FirstName, data.LastName, data.DateOfBirth, data.Gender, data.Status, data.CreatedAt]
            );
        }

        return { success: true };
    } catch (error) {
        console.error("Database error:", error.message);
        throw error;
    }
};
