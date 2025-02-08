const CartServices = require('../services/CartService');

const Cart = {
    getAllCarts: async (req, res) => {
        try {
            const result = await CartServices.getAllCarts();
            res.status(200).json(result[0]);
        }
        catch (error) {
            res.status(500).json(error);
        }
    },

    getCartByCusID: async (req, res) => {
        try {
            const cusID = req.body.cusID;
            const result = await CartServices.getCartByCusID(cusID);
            res.status(200).json(result);
        }
        catch (error) {
            res.status(500).json(error);
        }
    },

    addProductToCart: async (req, res) => {
        try {
            const { customerID, productID, quantity } = req.body;
            const result = await CartServices.addProductToCart(customerID, productID, quantity);
            res.status(201).json(result);
        }
        catch (error) {
            res.status(500).json(error);
        }
    },

    updateProductQuantity: async (req, res) => {
        try {
            const { cartDetailID, quantity } = req.body;
            const result = await CartServices.updateProductQuantity(cartDetailID, quantity);
            res.status(200).json(result);
        }
        catch (error) {
            res.status(500).json(error);
        }
    },

    removeProductFromCart: async (req, res) => {
        try {
            const { cartDetailID } = req.body;
            const result = await CartServices.removeProductFromCart(cartDetailID);
            res.status(200).json(result);
        }
        catch (error) {
            res.status(500).json(error);
        }
    }
};

module.exports = Cart;