const CustomerController = require('../controllers/CustomerController');
const express = require('express');

const router = express.Router();

router.post('/',CustomerController.getCustomerByID);

module.exports = router;