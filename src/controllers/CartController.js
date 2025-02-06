const CartServices = require('../services/CartService');

const Cart = {
    getAllCart: async (req, res) => {
        try {
            const result = await CartServices.getAllCart();
            res.status(200).json(result[0]);
        }
        catch (error) {
            res.status(500).json(error);
        }
    },

    getCartByCustomerId: async (req, res) => {
        try {
            const cusID = req.body.cusID;
            const result = await CartServices.getCartByCustomerId(cusID);
            res.status(200).json(result[0]);
        }
        catch (error) {
            res.status(500).json(error);
        }
    }
}
module.exports = Cart;