const pool = require('../config/Database');

const Carts = {
    getAllCarts: async () => {
        const result = await pool.query('select * from Cart');
        return result;
    },

    getCartByCustomerId: async (cusID) => {
        const result = await pool.query('select * from CartDetail where cusID = ?', [cusID]);
        return result;
    }
}

module.exports = Carts;