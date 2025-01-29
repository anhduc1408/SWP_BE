const OrderControllers = require('../controllers/OrderController')
const express = require('express')

const router = express.Router();

router.post('/',OrderControllers.getAllOrrders);
router.post('/cusID',OrderControllers.getOrderByCusID);
module.exports = router;
