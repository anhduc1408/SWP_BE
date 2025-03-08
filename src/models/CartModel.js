const pool = require('../config/Database');

const Carts = {
    getAllCart: async () => {
        const result = await pool.query('select * from Cart');
        return result[0];
    },
    getCartDetailByCusID: async (cusID) => {
        const result = await pool.query('select * from CartDetail where CartID in (select CartID from Cart where CustomerID = ? Order by CartID)', [cusID])
        return result[0];
    },
    removeCartDetail: async (cartDetailIDs) => {
        if (!Array.isArray(cartDetailIDs) || cartDetailIDs.length === 0) {
            throw new Error("Danh sách ID không hợp lệ!");
        }

        const query = `DELETE FROM CartDetail WHERE CartDetailID IN (${cartDetailIDs.map(() => '?').join(',')})`;
        await pool.query(query, [cartDetailIDs]);
    },
    updateCartDetailQuantity: async (cartID, quantity) => {
        if (quantity <= 0) {
            await pool.query('DELETE FROM CartDetail WHERE CartDetailID = ?', [cartID]);
        }
            await pool.query('UPDATE CartDetail SET Quantity = ? WHERE CartDetailID = ?', [quantity, cartID]);
    },
    getCartItemById: async (cartID) => {
        const result = await pool.query('select * from CartDetail where CartDetailID = ?', [cartID]);
        return result[0][0];
    },
}

module.exports = Carts;