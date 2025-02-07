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
    addOrder: async(cusID,totalPayment,OrderInfor)=>{
        const result = await pool.query('insert into Orders(CustomerID,Status,TotalAmount) values(?,"pending",?)',[cusID,totalPayment]);
        let query = 'insert into OrderDetail values';
        let values = OrderInfor.map(item => `(null, ${result[0].insertId}, ${item.productID},${item.Quantity})`);
        query += values.join(','); 
        await pool.query(query);
    }
}
module.exports = Orders;