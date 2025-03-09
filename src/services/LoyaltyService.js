const LoyaltyModel = require("../models/LoyaltyModel");

const LoyaltyService = {
    getLoyaltyData: async (customerId) => {
        return await LoyaltyModel.getLoyaltyData(customerId);
    }
};

module.exports = LoyaltyService;
