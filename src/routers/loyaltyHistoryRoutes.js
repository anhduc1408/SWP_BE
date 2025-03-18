const express = require("express");
const router = express.Router();
const LoyaltyHistoryController = require("../controllers/LoyaltyHistoryController");

// Định nghĩa API lấy lịch sử loyalty theo customerId
router.get("/:customerId", LoyaltyHistoryController.getLoyaltyHistory);

module.exports = router;
