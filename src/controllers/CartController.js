const CartService = require('../services/CartService');

const Cart = {
    getAllCart: async (req, res) => {
        try {
            const result = await CartService.getAllCarts();
            res.status(200).json(result[0]);
        } catch (error) {
            res.status(500).json(error);
        }
    },
    getCartByCusID: async (req, res) => {
        try {
            const cusID = req.body.cusID;
            const result = await CartService.getCartByCusID(cusID);
            res.status(200).json(result);
        } catch (error) {
            console.log(error)
            res.status(500).json(error);
        }
    },
    updateQuantity: async (req, res) => {
        try {
            const { cartDetailID, quantity } = req.body;
            if (!cartDetailID || quantity === undefined) {
                return res.status(400).json({ error: "Thiếu dữ liệu" });
            }
            const result = await CartService.updateCartDetailQuantity(cartDetailID, quantity);
            res.status(200).json(result);
        } catch (error) {
            res.status(500).json(error);
        }
    },
    deleteItem: async (req, res) => {
        try {
            const { cartDetailID } = req.body;
            if (!cartDetailID) {
                return res.status(400).json({ error: "Thiếu dữ liệu" });
            }
            await CartService.removeCartDetail([{ CartDetailID: cartDetailID }]);
            res.status(200).json({ message: "Item deleted successfully" });
        } catch (error) {
            res.status(500).json(error);
        }
    }
}
module.exports = Cart;