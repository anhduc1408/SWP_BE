const pool  = require('../config/Database');
const Orders = {
    getAllOrders:async()=>{
        const result = await pool.query('select * from Orders')
        return result;
    },
    getOrderByCusId:async(cusID)=>{
        const result = await pool.query('select * from Orders where customerID = ?', [cusID])
        return result;
    }
}
module.exports = Orders;