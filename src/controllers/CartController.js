const CartService = require('../services/CartService');

const Cart = {
    getAllCart:async(req,res)=>{
        try {
            const result = await CartService.getAllCarts();
            res.status(200).json(result[0]);
        } catch (error) {
            res.status(500).json(error);
        }
    },
    getCartByCusID: async(req,res)=>{
        try {
            const cusID = req.body.cusID;
            const result = await CartService.getCartByCusID(cusID);
            res.status(200).json(result);
        } catch (error) {
            console.log(error)
            res.status(500).json(error);
        }
    }
}
module.exports = Cart;