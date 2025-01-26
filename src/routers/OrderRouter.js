const OrderControllers = require('../controllers/OrderController')
const express = require('express')

const router = express.Router();


router.get('/',OrderControllers.getAllOrrders);
module.exports = router;
