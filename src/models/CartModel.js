const pool = require('../config/Database');

const Carts = {
    getAllCart:async()=>{
        const result = await pool.query('select * from Cart');
        return result;
    },
    getCartByCusID: async(cusID)=>{
        const result = await pool.query('select * from Cart where CustomerID = ?',[cusID])
    }
}
module.exports = Carts;