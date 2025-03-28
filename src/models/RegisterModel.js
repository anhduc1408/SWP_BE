const pool = require("../config/Database");

const Register = {
    addCustomer: async (body) => {
        const {
            FirstName,
            LastName,
            Email,
            password,
            DateOfBirth,
            BankAccountNumber,
            PhoneNumber,
            Gender,
            Avatar = null,  
            Xu = 0          
        } = body;

        try {
            const [existingCustomer] = await pool.query("SELECT * FROM Customer WHERE Email = ?", [Email]);
            if (existingCustomer.length > 0) {
                return { success: false, message: "Email đã tồn tại!" };
            }

            const sql = `
                INSERT INTO Customer
                (FirstName, LastName, Email, password, DateOfBirth, BankAccountNumber, PhoneNumber, Gender, Avatar, Xu) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `;

            await pool.query(sql, [FirstName, LastName, Email, password, DateOfBirth, BankAccountNumber, PhoneNumber, Gender, Avatar, Xu]);

            return { success: true, message: "Đăng ký thành công!" };
        } catch (error) {
            console.error("Lỗi khi đăng ký tài khoản:", error);
            return { success: false, message: "Lỗi server!" };
        }
    }
};

module.exports = Register;
