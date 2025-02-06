const Orders = require('../models/OrderModel');
const Voucher = require('./VoucherService')
const Cart = require('./CartService')

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
    }
}
module.exports = OrderServices;