const pool = require("../config/Database");

const AffiliateTrackingModel = {
    // Lấy dữ liệu tiếp thị theo CustomerID từ AffiliateTracking & Customer (JOIN để lấy `xu`)
    // Lấy dữ liệu tiếp thị từ AffiliateTracking + Lấy xu từ Customer (JOIN)
    getAffiliateStatsByCustomer: async (customerId) => {
        const [rows] = await pool.query(
            `SELECT a.CustomCode, a.Clicks, c.xu 
         FROM AffiliateTracking a
         JOIN Customer c ON a.ReferrerID = c.CustomerID
         WHERE a.ReferrerID = ?`,
            [customerId]
        );

        return rows;
    },

    // Lấy lịch sử tiếp thị từ AffiliateHistory
    getAffiliateHistory: async (customerId) => {
        const [rows] = await pool.query(
            `SELECT c.FirstName, c.LastName, h.CustomCode, h.CreatedAt
             FROM AffiliateHistory h
             JOIN Customer c ON h.ReferredUserID = c.CustomerID
             JOIN AffiliateTracking a ON h.CustomCode = a.CustomCode
             WHERE a.ReferrerID = ?
             ORDER BY h.CreatedAt DESC`,
            [customerId]
        );
        return rows;
    },

    // Tăng số lượt click khi nhập mã
    increaseClickCount: async (customCode) => {
        await pool.query(
            `UPDATE AffiliateTracking SET Clicks = Clicks + 1 WHERE CustomCode = ?`,
            [customCode]
        );
    },

    // Lấy ID người giới thiệu từ CustomCode
    getReferrerByCode: async (customCode) => {
        const [rows] = await pool.query(
            `SELECT ReferrerID FROM AffiliateTracking WHERE CustomCode = ?`,
            [customCode]
        );
        return rows.length > 0 ? rows[0].ReferrerID : null;
    },

    // Lấy tên khách hàng từ CustomerID
    getCustomerNameById: async (customerId) => {
        const [rows] = await pool.query(
            `SELECT FirstName, LastName FROM Customer WHERE CustomerID = ?`,
            [customerId]
        );
        return rows.length > 0 ? `${rows[0].FirstName} ${rows[0].LastName}` : "Unknown";
    },

    // Cộng xu cho người giới thiệu
    addRewardsToReferrer: async (referrerId, amount) => {
        await pool.query(
            `UPDATE Customer SET xu = xu + ? WHERE CustomerID = ?`,
            [amount, referrerId]
        );
    },

    // Lưu lịch sử tiếp thị khi nhập mã
    saveAffiliateHistory: async (customCode, referredUserId) => {
        await pool.query(
            `INSERT INTO AffiliateHistory (ReferredUserID, CustomCode) VALUES (?, ?)`,
            [referredUserId, customCode]
        );
    }
};

module.exports = AffiliateTrackingModel;
