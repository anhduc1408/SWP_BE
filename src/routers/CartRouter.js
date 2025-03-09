const CartController = require('../controllers/CartController');
const express = require('express');

const router =  express.Router();
// http://localhost:3001/api/Cart/CheckOut

router.post('/',CartController.getAllCart); 
router.post('/cusID',CartController.getCartByCusID);
router.put('/updateQuantity', CartController.updateQuantity);
router.delete('/deleteItem', CartController.deleteItem);
router.post('/update', CartController.updateCartDetail);


module.exports = router;