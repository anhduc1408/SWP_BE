const CartModel = require('../models/CartModel');
const ProductModel = require('../models/ProductModel');
const { get } = require('../routers/CartRouter');

const Cart = {
    getAllCart: async () => {
        const result = await CartModel.getAllCarts();
    },
    
    getCartByCustomerId: async (cusID) => {
        let result = [];
        const CartDetail = await CartModel.getCartByCustomerId(cusID);
        await Promise.all(CartDetail.map(async (item) => {
            const product = await ProductModel.getProductById(item.proID);
            const tmp = {
                CartID: item.CartID,
                productImg: product[0].productImg,
                productName: product[0].productName,
                productCategory: product[0].productCategory,
                productPrice: product[0].productPrice,
                Quantity: item.Quantity,
                totalAmount: item.TotalAmount
            }
            result.push(tmp);
        }))
        return result;
    }
}

module.exports = Cart;