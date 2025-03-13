const LoyaltyModel = require("../models/LoyaltyModel");

const LoyaltyService = {
    getLoyaltyDetails: async (customerId) => {
        // Kiểm tra loyalty
        const loyalty = await LoyaltyModel.getLoyaltyByCustomerId(customerId);
        if (!loyalty) {
            throw new Error("Không tìm thấy thông tin khách hàng thân thiết");
        }

        // Kiểm tra customer
        const customer = await LoyaltyModel.getCustomerById(customerId);
        if (!customer) {
            throw new Error("Khách hàng không tồn tại");
        }

        // Lấy lịch sử tích điểm
        const history = await LoyaltyModel.getLoyaltyHistoryByCustomerId(customerId);

        const loyaltyInfo = {
            name: `${customer.FirstName} ${customer.LastName}`,
            email: customer.Email,
            currentTier: loyalty.currentTier,
            currentPoints: loyalty.currentPoints,
            pointsToNextTier: loyalty.pointsToNextTier,
            lastUpdated: loyalty.lastUpdated
        };

        const loyaltyHistory = await Promise.all(history.map(async item => {
            const order = await LoyaltyModel.getOrderById(item.orderId);
            return {
                historyId: item.historyId,
                transactionDate: item.transactionDate,
                orderId: order.OrderID,
                totalAmount: order.TotalAmount,
                pointsEarned: item.pointsEarned
            };
        }));

        return { loyaltyInfo, loyaltyHistory };
    }
};

module.exports = LoyaltyService;
