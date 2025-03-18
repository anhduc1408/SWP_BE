const LoyaltyModel = require("../models/LoyaltyModel");

const determineLoyaltyTier = (totalOrders, totalSpent) => {
    if (totalOrders >= 10 || totalSpent >= 5000000) return "Diamond";
    if (totalOrders >= 6 || totalSpent >= 3000000) return "Gold";
    if (totalOrders >= 3 || totalSpent >= 1000000) return "Silver";
    return "Bronze";
};

const LoyaltyService = {
    getLoyaltyDetails: async (customerId) => {
        const customer = await LoyaltyModel.getCustomerById(customerId);
        if (!customer) {
            throw new Error("Khách hàng không tồn tại");
        }

        const { totalOrders, totalSpent } = await LoyaltyModel.getOrderStatsByCustomerId(customerId);
        const currentTier = determineLoyaltyTier(totalOrders, totalSpent);

        // Lấy danh sách phần thưởng theo hạng
        const rewards = await LoyaltyModel.getRewardsByTier(currentTier);

        return {
            name: `${customer.FirstName} ${customer.LastName}`,
            email: customer.Email,
            totalOrders,
            totalSpent,
            currentTier,
            rewards
        };
    }
};

module.exports = LoyaltyService;
