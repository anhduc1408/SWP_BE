const LoyaltyHistoryService = require("../services/LoyaltyHistoryService");

const LoyaltyHistoryController = {
    getLoyaltyHistory: async (req, res) => {
        try {
            const { customerId } = req.params;

            if (!customerId) {
                return res.status(400).json({ message: "customerId không hợp lệ!" });
            }

            console.log(`📌 Nhận request lấy lịch sử loyalty của customerId: ${customerId}`);

            const history = await LoyaltyHistoryService.getLoyaltyHistory(customerId);

            if (!history || history.orderHistory.length === 0) {
                return res.status(404).json({ message: "Không tìm thấy lịch sử loyalty!" });
            }

            res.json(history);
        } catch (error) {
            console.error("❌ Lỗi khi lấy lịch sử loyalty:", error);
            res.status(500).json({ message: "Lỗi máy chủ khi lấy lịch sử loyalty." });
        }
    }
};

module.exports = LoyaltyHistoryController;
