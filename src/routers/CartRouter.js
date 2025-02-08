const CartController = require('../controllers/CartController');
const express = require('express');

const router = express.Router();

router.get('/', CartController.getAllCarts);
router.get('/cusID', CartController.getCartByCusID);

module.exports = router;