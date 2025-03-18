const AffiliateTrackingService = require("../services/AffiliateTrackingService");

const AffiliateTrackingController = {
    // Lấy thống kê tiếp thị theo CustomerID
    getAffiliateStatsByCustomer: async (req, res) => {
        try {
            const { customerId } = req.params;
            const stats = await AffiliateTrackingService.getAffiliateStats(customerId);

            if (!stats) {
                return res.status(404).json({ message: "Không có dữ liệu tiếp thị." });
            }

            res.json(stats);
        } catch (error) {
            console.error("❌ Lỗi lấy dữ liệu tiếp thị:", error);
            res.status(500).json({ message: "Lỗi máy chủ." });
        }
    },

    // Lấy lịch sử tiếp thị
    getAffiliateHistoryByCustomer: async (req, res) => {
        try {
            const { customerId } = req.params;
            const history = await AffiliateTrackingService.getAffiliateHistory(customerId);

            if (!history) {
                return res.status(404).json({ message: "Không có lịch sử tiếp thị." });
            }

            res.json(history);
        } catch (error) {
            console.error("❌ Lỗi lấy lịch sử tiếp thị:", error);
            res.status(500).json({ message: "Lỗi máy chủ." });
        }
    },

    // Xử lý nhập mã tiếp thị từ người khác
    trackAffiliateClick: async (req, res) => {
        try {
            const { customCode, customerId } = req.body;

            if (!customCode || !customerId) {
                return res.status(400).json({ message: "Mã tiếp thị hoặc CustomerID không hợp lệ." });
            }

            const result = await AffiliateTrackingService.trackAffiliateClick(customCode, customerId);
            if (!result) {
                return res.status(404).json({ message: "Mã tiếp thị không tồn tại hoặc đã được sử dụng." });
            }

            res.json({ message: `Bạn đã giúp ${result.referrerName} nhận ${result.amount} xu!` });
        } catch (error) {
            console.error("❌ Lỗi khi theo dõi lượt click:", error);
            res.status(500).json({ message: "Lỗi máy chủ." });
        }
    }
};

module.exports = AffiliateTrackingController;
