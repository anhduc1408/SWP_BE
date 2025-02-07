const pool = require('../config/Database');

const Customer = {
    getCustomerByID:async(cusID)=>{
        const result = await pool.query('select * from Customer where CustomerID = ?',[cusID]);
        return result;
    }
}
module.export = Customer;