const express = require('express');
const router = express.Router();
const SupportController = require('../controllers/supportController');

router.post('/request', SupportController.createRequest);
router.get('/requests/:customer_id', SupportController.getUserRequests);

module.exports = router;
