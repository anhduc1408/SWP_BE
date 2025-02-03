const OrderControllers = require('../controllers/OrderController')
const express = require('express')

const router = express.Router();
// http://localhost:3001/api/Cart/CheckOut
router.post('/',OrderControllers.getAllOrrders);
router.post('/cusID',OrderControllers.getOrderByCusID);
router.post('/checkOut',OrderControllers.addOrder);

module.exports = router;
