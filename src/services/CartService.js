const CartModel = require('../models/CartModel');
const ProductModel = require('../models/ProductModel');

const Cart = {
    getAllCarts: async () => {
        return await CartModel.getAllCarts();
    },

    getCartByCusID: async (cusID) => {
        let result = [];
        const cartDetail = await CartModel.getCartDetailByCusID(cusID);
        await Promise.all(cartDetail.map(async (item) => {
            const product = await ProductModel.getProductForCart(item.ProductID);
            const tmp = {
                cartID: item.CartID,
                productID: product[0].ProductID,
                productImg: product[0].ProductImg,
                productName: product[0].ProductName,
                productCategory: product[0].Category,
                productPrice: product[0].Price,
                Quantity: item.Quantity,
                totalAmount: item.Quantity * product[0].Price
            }
            result.push(tmp);
        }))
        return result;
    },

    addProductToCart: async (cartID, productID, quantity) => {
        return await CartModel.addProductToCart(cartID, productID, quantity);
    },

    removeProductFromCart: async (cartDetailID) => {
        return await CartModel.removeProductFromCart(cartDetailID);
    },

    updateProductQuantity: async (cartDetailID, quantity) => {
        return await CartModel.updateProductQuantity(cartDetailID, quantity);
    }
}

module.exports = Cart;