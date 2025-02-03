const Orders = require('../models/OrderModel');

const OrderServices = {
    getAllOrder: async ()=>{
        return await Orders.getAllOrders();
    },
    getOrderByCusID:async(cusID)=>{
        return await Orders.getOrderByCusId(cusID)
    },
    addOrder:async (products,voucher,totalPayment,cusID)=>{
        try {
            const addOrder = Orderds.addOrder(cusID,totalPayment)
        } catch (error) {
            
        }
    }
}
module.exports = OrderServices;