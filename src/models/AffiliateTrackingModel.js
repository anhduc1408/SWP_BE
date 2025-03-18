const pool = require("../config/Database");

const AffiliateTrackingModel = {
    // 📌 Lấy dữ liệu tiếp thị theo CustomerID (CustomCode, Clicks, Xu)
    getAffiliateStatsByCustomer: async (customerId) => {
        const [rows] = await pool.query(
            `SELECT 
                a.CustomCode, 
                a.Clicks, 
                c.xu AS Xu 
             FROM AffiliateTracking a
             JOIN Customer c ON a.ReferrerID = c.CustomerID
             WHERE a.ReferrerID = ?`,
            [customerId]
        );
        return rows;
    },

    // 📌 Tăng số lượt click khi nhập mã tiếp thị
    increaseClickCount: async (customCode) => {
        await pool.query(
            `UPDATE AffiliateTracking SET Clicks = Clicks + 1 WHERE CustomCode = ?`,
            [customCode]
        );
    },

    // 📌 Lấy ReferrerID (người giới thiệu) từ CustomCode
    getReferrerByCode: async (customCode) => {
        const [rows] = await pool.query(
            `SELECT ReferrerID FROM AffiliateTracking WHERE CustomCode = ?`,
            [customCode]
        );
        return rows.length > 0 ? rows[0].ReferrerID : null;
    },

    // 📌 Cộng xu cho người giới thiệu khi có người nhập mã
    addRewardsToReferrer: async (referrerId, amount) => {
        await pool.query(
            `UPDATE Customer SET xu = xu + ? WHERE CustomerID = ?`,
            [amount, referrerId]
        );
    }
};

module.exports = AffiliateTrackingModel;
