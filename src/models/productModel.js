const pool = require("../config/Database");
const Products = {
    getAllProductsNew: async (option, type) => {
    if (option === "Tất Cả") {
      if (type === "New") {
        console.log(123);
        const result = await pool.query(
          "SELECT * FROM Product ORDER BY ProductID DESC LIMIT 10"
        );
        console.log();
        return result;
      }
    }
    console.log(option, type);
  },

  getAllCategory: async () => {
    const result = await pool.query("SELECT DISTINCT Category FROM Product");
    return result;
  },
};
module.exports = Products;
