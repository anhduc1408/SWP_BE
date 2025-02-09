const pool = require('../config/Database');

const Customers = {
    getAllCustomers: async () => {
        const result = await pool.query('SELECT * FROM Customer');
        return result[0];
    },

    getCustomerById: async (CustomerID) => {
        const result = await pool.query('SELECT * FROM Customer WHERE CustomerID = ?', [CustomerID]);
        return result[0][0]; 
    },

    updateCustomerById: async (CustomerID, customerData) => {
        const oldCustomerQuery = await pool.query('SELECT * FROM Customer WHERE CustomerID = ?', [CustomerID]);
        const oldCustomer = oldCustomerQuery[0][0];
    
        if (!oldCustomer) {
            throw new Error('Khách hàng không tồn tại');
        }
    
        // Giữ nguyên dữ liệu cũ nếu không có giá trị mới
        const updatedCustomer = {
            FirstName: customerData.FirstName || oldCustomer.FirstName,
            LastName: customerData.LastName || oldCustomer.LastName,
            DateOfBirth: customerData.DateOfBirth || oldCustomer.DateOfBirth,
            Email: customerData.Email || oldCustomer.Email,
            PhoneNumber: customerData.PhoneNumber || oldCustomer.PhoneNumber,
            Gender: customerData.Gender || oldCustomer.Gender,
            password: customerData.password || oldCustomer.password,
            Avatar: customerData.Avatar || oldCustomer.Avatar
        };
    

        const result = await pool.query(
            'UPDATE Customer SET FirstName = ?, LastName = ?, DateOfBirth = ?, Email = ?, PhoneNumber = ?, Gender = ?, password = ?, Avatar = ? WHERE CustomerID = ?',
            [updatedCustomer.FirstName, updatedCustomer.LastName, updatedCustomer.DateOfBirth, updatedCustomer.Email, updatedCustomer.PhoneNumber, updatedCustomer.Gender, updatedCustomer.password, updatedCustomer.Avatar, CustomerID]
        );
    
        return result;
    }
    
};

module.exports = Customers;
