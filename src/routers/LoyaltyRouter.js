const express = require("express");
const LoyaltyController = require("../controllers/LoyaltyController");

const router = express.Router();

router.get("/:customerId", LoyaltyController.getLoyaltyStatus);

module.exports = router;
