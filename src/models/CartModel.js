const pool = require('../config/Database');

const Carts = {
    getAllCarts: async () => {
        const result = await pool.query(`SELECT * FROM Cart`);
        return result[0];
    },

    getCartDetailByCusID: async (cusID) => {
        const result = await pool.query('select * from CartDetail where CartID in (select CartID from Cart where CustomerID = ?)', [cusID]);
        return result[0];
    },

    addProductToCart: async (cartID, productID, quantity) => {
        let cart = await pool.query(`SELECT * FROM Cart WHERE CartID = ?`, [cartID]);
        if(cart[0].length === 0) {
            await pool.query(`INSERT INTO Cart (CartID, CustomerID) VALUES (?, ?)`, [cartID, customerID]);
            cart = { CartID: newCart[0].insertId };
        } else {
            cart = cart[0][0];
        }

        const result = await pool.query(`INSERT INTO CartDetail (CartID, ProductID, Quantity) VALUES (?, ?, ?)`, [cartID, productID, quantity]);
        return result[0].insertId;
    },

    removeProductFromCart: async (cartDetailID) => {
        const result = await pool.query(`DELETE FROM CartDetail WHERE CartDetailID = ?`, [cartDetailID]);
        return result[0].affectedRows;
    },

    updateProductQuantity: async (cartDetailID, quantity) => {
        const result = await pool.query(`UPDATE CartDetail SET Quantity = ? WHERE CartDetailID = ?`, [quantity, cartDetailID]);
        return result[0].affectedRows;
    }
}

module.exports = Carts;