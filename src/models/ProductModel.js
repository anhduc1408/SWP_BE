const pool = require('../config/Database');

const Product = {
    getProductForCart: async (id) => {
        const result = await pool.query('select ProductID,ProductName, Category,ProductImg, Price as ProductPrice from Product where ProductID = ?', [id]);
        return result[0];
    }
}

module.exports = Product;