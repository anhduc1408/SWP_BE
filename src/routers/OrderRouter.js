const OrderControllers = require('../controllers/OrderController')
const express = require('express')

const router = express.Router();
// http://localhost:3001/api/Order/CheckOut
router.post('/',OrderControllers.getAllOrrders);
router.post('/cusID',OrderControllers.getOrderByCusID);
router.post('/CheckOut',OrderControllers.addOrder);

module.exports = router;
