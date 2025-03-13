const pool = require("../config/Database");

const LoyaltyModel = {
    getLoyaltyByCustomerId: async (customerId) => {
        const [rows] = await pool.query(
            "SELECT * FROM G5_Customer.Loyalty WHERE customerId = ?",
            [customerId]
        );
        return rows[0];  // Chỉ lấy dòng đầu tiên nếu có
    },

    getCustomerById: async (customerId) => {
        const [rows] = await pool.query(
            "SELECT * FROM G5_Customer.Customer WHERE CustomerId = ?",
            [customerId]
        );
        return rows[0]; // Chỉ lấy dòng đầu tiên nếu có
    },

    getLoyaltyHistoryByCustomerId: async (customerId) => {
        const [rows] = await pool.query(
            "SELECT * FROM G5_Customer.LoyaltyHistory WHERE customerId = ? ORDER BY transactionDate DESC",
            [customerId]
        );
        return rows;
    },

    getOrderById: async (orderId) => {
        const [rows] = await pool.query(
            "SELECT * FROM G5_Customer.Orders WHERE OrderID = ?",
            [orderId]
        );
        return rows[0];
    }
};

module.exports = LoyaltyModel;
