const LoyaltyHistoryModel = require("../models/LoyaltyHistoryModel");

const LoyaltyHistoryService = {
    getLoyaltyHistory: async (customerId) => {
        const orderHistory = await LoyaltyHistoryModel.getOrderHistoryByCustomerId(customerId);

        return { orderHistory };
    }
};

module.exports = LoyaltyHistoryService;
