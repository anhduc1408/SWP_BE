const LoyaltyService = require("../services/LoyaltyService");

const LoyaltyController = {
    getLoyaltyStatus: async (req, res, next) => {
        try {
            const { customerId } = req.params;
            const loyaltyData = await LoyaltyService.getLoyaltyData(customerId);

            if (!loyaltyData) {
                return res.status(404).json({ error: "Customer not found" });
            }

            res.status(200).json(loyaltyData);
        } catch (error) {
            next(error);
        }
    }
};

module.exports = LoyaltyController;
