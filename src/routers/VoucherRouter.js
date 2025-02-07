const VoucherController = require('../controllers/VoucherController');
const express = require('express')

const router = express.Router();
router.post('/getVoucherByCusID',VoucherController.getVoucherByCusID)

module.exports = router