const CartModel = require('../models/CartModel');
const ProductModel  = require('../models/ProductModel');

const Cart = {
    getAllCarts:async()=>{
        return await CartModel.getAllCart();
    },
    getCartByCusID: async(cusID)=>{
        let result = []
        const CartDetail =  await CartModel.getCartDetailByCusID(cusID);
        await Promise.all( CartDetail.map( async(item)=>{
            const product = await ProductModel.getProductForCart(item.ProductID);
            const tmp = {
                cartID: item.CartDetailID,
                productID: product[0].ProductID,
                productImg :product[0].ProductImg,
                productName : product[0].ProductName,
                productCategory: product[0].Category,
                productPrice:product[0].Price,
                Quantity:item.Quantity,
                totalAmount: item.Quantity * product[0].Price
            }
            result.push(tmp);
        }))
        return result;
    },
    removeCartDetail:async(OrderInfor)=>{
        await CartModel.removeCartDetail(OrderInfor);
    }
}
module.exports = Cart;