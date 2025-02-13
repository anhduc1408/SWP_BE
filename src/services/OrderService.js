const Orders = require('../models/OrderModel');
const Voucher = require('./VoucherService')
const Cart = require('./CartService')
const Product = require('../models/ProductModel');

const OrderServices = {
    getAllOrder: async ()=>{
        return await Orders.getAllOrders();
    },
    getOrderByCusID:async(cusID)=>{
        return await Orders.getOrderByCusId(cusID)
    },
    addOrder:async (OrderInfor,voucher,totalPayment,cusID)=>{
            await Orders.addOrder(cusID,totalPayment,OrderInfor);
            await Cart.removeCartDetail(OrderInfor)
            if(voucher){
                await Voucher.removeVoucherDetail(cusID,voucher);
            }
    },
    getOrderDetailByCusID: async (cusID)=>{
        const OderDetail = await Orders.getOrderDetailByCusID(cusID);
        const result  = await Promise.all(OderDetail.map(async(item)=>{
            const query = await Product.getProductByProID(item.ProductID);
            const tmp = {
                category:query[0].Category,
                status:item.Status,
                productName:query[0].ProductName,
                description:query[0].Description,
                price:query[0].Price,
                productImg: query[0].ProductImg,
                quantity:item.Quantity,
                shopID:query[0].ShopID
            }
            return tmp;
        }))   
        return result;  
    }
}
module.exports = OrderServices;