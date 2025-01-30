const pool = require('../config/Database');

const Carts = {
    getAllCart:async()=>{
        const result = await pool.query('select * from Cart');
        return result;
    },
    getCartDetailByCusID: async(cusID)=>{
        const result = await pool.query('select * from CartDetail where CartID in (select CartID from Cart where CustomerID = ?)',[cusID])
        return result[0];
    }
}
module.exports = Carts;