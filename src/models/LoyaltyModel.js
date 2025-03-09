const db = require("../config/Database");

const LoyaltyModel = {
    getLoyaltyData: async (customerId) => {
        try {
            const query = `
                SELECT 
                    l.CustomerID AS customer_id,
                    CONCAT(c.FirstName, ' ', c.LastName) AS username,
                    l.TotalOrders AS total_orders,
                    l.TotalSpent AS total_spent,
                    l.Tier AS tier,
                    l.LastUpdated AS last_updated
                FROM G5_Customer.Loyalty l
                JOIN G5_Customer.Customer c ON l.CustomerID = c.CustomerID
                WHERE l.CustomerID = ?;
            `;

            const [rows] = await db.execute(query, [customerId]);

            return rows.length ? rows[0] : null;
        } catch (error) {
            console.error("Lỗi truy vấn Loyalty:", error.message);
            throw new Error("Lỗi lấy dữ liệu thành viên");
        }
    }
};

module.exports = LoyaltyModel;
