const pool  = require('../config/Database');
const { getOrderDetailByCusID } = require('../services/OrderService');
const Orders = {
    getAllOrders:async()=>{
        const result = await pool.query('select * from Orders')
        return result;
    },
    getOrderByCusId:async(cusID)=>{
        const result = await pool.query('select * from Orders where CustomerID = ?', [cusID]);
        return result[0];
    },
    addOrder: async(cusID,totalPayment,OrderInfor)=>{
        const result = await pool.query('insert into Orders(CustomerID,Status,TotalAmount) values(?,"Vận chuyển",?)',[cusID,totalPayment]);
        let query = 'insert into OrderDetail values';
        let values = OrderInfor.map(item => `(null, ${result[0].insertId}, ${item.productID},${item.Quantity})`);
        query += values.join(','); 
        await pool.query(query);
    },
    getOrderDetailByCusID: async(cusID)=>{ 
        const result = await pool.query('select ProductID,Quantity from OrderDetail where OrderID in (select OrderID from Orders where CustomerID = ?)',[cusID]);
        return result[0];
    }
}
module.exports = Orders;