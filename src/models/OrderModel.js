const pool  = require('../config/Database');
const Orders = {
    getAllOrders:async()=>{
        const result = await pool.query('select * from Orders')
        return result;
    },
    getOrderByCusId:async(cusID)=>{
        const result = await pool.query('select * from Orders where customerID = ?', [cusID]);
        return result[0];
    },
    addOrder: async(cusID,totalPayment)=>{
        const result = await pool.query('insert into Orders values ')
    }
}
module.exports = Orders;