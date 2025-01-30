const CartController = require('../controllers/CartController');
const express = require('express');

const router =  express.Router();

router.post('/',CartController.getAllCart); 
router.post('/cusID',CartController.getCartByCusID);
module.exports = router;