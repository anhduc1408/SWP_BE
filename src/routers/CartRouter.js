const CartController = require('../controllers/CartController');
const express = require('express');

const router = express.Router();

router.get('/',CartController.getAllCart);
router.get('/cusID',CartController.getCartByCustomerId);

module.exports = router;