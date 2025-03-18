const AffiliateTrackingService = require("../services/AffiliateTrackingService");

const AffiliateTrackingController = {
    // 📌 API lấy thông tin tiếp thị theo CustomerID
    getAffiliateStatsByCustomer: async (req, res) => {
        try {
            const { customerId } = req.params;
            const stats = await AffiliateTrackingService.getAffiliateStats(customerId);

            if (!stats) {
                return res.status(404).json({ message: "Không có dữ liệu tiếp thị." });
            }

            res.json(stats);
        } catch (error) {
            console.error("Lỗi lấy dữ liệu tiếp thị:", error);
            res.status(500).json({ message: "Lỗi máy chủ." });
        }
    },

    // 📌 API xử lý nhập mã tiếp thị từ người khác
    trackAffiliateClick: async (req, res) => {
        try {
            const { customCode } = req.body;

            if (!customCode) {
                return res.status(400).json({ message: "Mã tiếp thị không hợp lệ." });
            }

            const result = await AffiliateTrackingService.trackAffiliateClick(customCode);
            if (!result) {
                return res.status(404).json({ message: "Mã tiếp thị không tồn tại." });
            }

            res.json({ message: `Bạn đã giúp ${result.referrerId} nhận ${result.amount} xu!` });
        } catch (error) {
            console.error("Lỗi khi theo dõi lượt click:", error);
            res.status(500).json({ message: "Lỗi máy chủ." });
        }
    }
};

module.exports = AffiliateTrackingController;
