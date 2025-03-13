const LoyaltyService = require("../services/LoyaltyService");

const LoyaltyController = {
    getLoyaltyByCustomerId: async (req, res) => {
        try {
            const customerId = req.params.customerId;
            const loyaltyDetails = await LoyaltyService.getLoyaltyDetails(customerId);
            res.status(200).json(loyaltyDetails);
        } catch (error) {
            console.error("LoyaltyController Error:", error.message);
            res.status(500).json({ message: error.message });
        }
    }
};

module.exports = LoyaltyController;
