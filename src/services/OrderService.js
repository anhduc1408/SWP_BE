const Orders = require('../models/OrderModel');

const OrderServices = {
    getAllOrder: async ()=>{
        return await Orders.getAllOrders();
    },
    getOrderByCusID:async(cusID)=>{
        return await Orders.getOrderByCusId(cusID)
    }
}
module.exports = OrderServices;