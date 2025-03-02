const pool = require('../config/Database');

const SupportModel = {
    createRequest: async (customer_id, category, subject, details) => {
        try {
            const [result] = await pool.query(
                'INSERT INTO SupportRequests (customer_id, category, subject, details) VALUES (?, ?, ?, ?)',
                [customer_id, category, subject, details]
            );
            return { id: result.insertId, customer_id, category, subject, details, status: 'pending' };
        } catch (error) {
            console.error("Lỗi khi tạo yêu cầu hỗ trợ:", error);
            throw new Error("Lỗi khi tạo yêu cầu hỗ trợ.");
        }
    },

    getUserRequests: async (customer_id) => {
        try {
            const [rows] = await pool.query(
                'SELECT * FROM SupportRequests WHERE customer_id = ? ORDER BY created_at DESC',
                [customer_id]
            );
            return rows;
        } catch (error) {
            console.error("Lỗi khi lấy lịch sử yêu cầu:", error);
            throw new Error("Lỗi khi lấy lịch sử yêu cầu.");
        }
    }
};

module.exports = SupportModel;
