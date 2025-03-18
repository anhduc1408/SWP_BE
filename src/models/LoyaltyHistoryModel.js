const pool = require("../config/Database");

const LoyaltyHistoryModel = {
    getOrderHistoryByCustomerId: async (customerId) => {
        const [rows] = await pool.query(
            `SELECT OrderID AS orderId, TotalAmount AS pointsEarned, CreateAt AS transactionDate 
             FROM Orders 
             WHERE CustomerID = ? 
             ORDER BY CreateAt DESC`,
            [customerId]
        );
        return rows;
    }
};

module.exports = LoyaltyHistoryModel;
