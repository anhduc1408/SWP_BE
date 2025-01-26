const pool  = require('../config/Database');
const Orders = {
    getAllOrders:async()=>{
        const result = await pool.query('select * from Orders')
        return result;
    }
}
module.exports = Orders;