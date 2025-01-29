const CartModel = require('../models/CartModel');

const Cart = {
    getAllCarts:async()=>{
        return await CartModel.getAllCart();
    },
    getCartByCusID: async(cusID)=>{
        return await CartModel.getCartByCusID(cusID);
    }
}
module.exports = Cart;