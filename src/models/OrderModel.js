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
    addOrder: async(cusID,totalPayment,OrderInfor,voucher)=>{
        const voucherAll = voucher[voucher.length -1];
        const result = await pool.query('insert into Orders(CustomerID,TotalAmount,VoucherID,discount) values(?,?,?,?)',[cusID,totalPayment,voucherAll.voucher.VoucherID,voucherAll.Discount]);
        let query = 'insert into OrderDetail values';                                               
        let values = OrderInfor.map((item,index) => {
            const voucherID =voucher[index].voucher? voucher[index].voucher.VoucherID : null;
           return `(null, ${result[0].insertId}, ${item.productID},${item.Quantity},${voucherID},null,null,${item.distance},"Vận chuyển",${voucher[index].Discount},${item.feeShip})`;
        });
        query += values.join(','); 
        await pool.query(query);
    },
    getOrderDetailByCusID: async(cusID)=>{ 
        const result = await pool.query('select ProductID,Quantity,Status,VoucherID,discount,ShipperID from OrderDetail where OrderID in (select OrderID from Orders where CustomerID = ?)',[cusID]);
        return result[0];
    }
}
module.exports = Orders;