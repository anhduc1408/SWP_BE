const Orders = require('../models/OrderModel');

const OrderServices = {
    getAllOrder: async ()=>{
        return await Orders.getAllOrders();
    }
}
module.exports = OrderServices;