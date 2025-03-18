const pool = require("../config/Database");

const CustomerBehaviorModel = {
  addCustomerBehavior: async (cusID, productID, category, type, shopID) => {
    const query = `
        INSERT INTO CustomerBehavior (customer_id, product_id, category, action_type, created_at, shop_ID) 
        VALUES (?, ?, ?, ?, NOW(), ?)
    `;

    const result = await pool.query(query, [
      cusID,
      productID,
      category,
      type,
      shopID,
    ]);
    return result[0]; // Trả về kết quả của query
  },

  getCategoryByShop: async (customerID, shopID) => {
    try {
      let result = await pool.query(
        `SELECT distinct category
         FROM CustomerBehavior
         WHERE customer_id = ? AND shop_ID = ?`,
        [customerID, shopID]
      );
  
      if (result[0].length === 0) {
        result = await pool.query(
          `SELECT distinct category
FROM CustomerBehavior
WHERE customer_id = ? 
`, 
          [customerID]
        );
        return result[0];  
      }
      return result[0];
    } catch (error) {
      console.error("Database query failed:", error);
      throw error;
    }
  },

  getCustomerFollowedShops: async (customerID) => {
    try {
      let result = await pool.query(
        `SELECT distinct shop_ID
         FROM CustomerBehavior
         WHERE customer_id = ?`,
        [customerID]
      );
    
      if (result[0].length === 0) {
        result = await pool.query(
          `SELECT shop_ID
FROM CustomerBehavior
GROUP BY shop_ID
ORDER BY COUNT(shop_ID) DESC
LIMIT 3;
`
        );
        return result[0];  // Trả về kết quả
      }
      return result[0];
    } catch (error) {
      console.error("Database query failed:", error);
      throw error;
    }
  },

  getBehaviorCustomerProducts: async (customerID) => {
    try {
      let result = await pool.query(
        `SELECT distinct category
         FROM CustomerBehavior
         WHERE customer_id = ?`,
        [customerID]
      );
    
      if (result[0].length === 0) {
        result = await pool.query(
          `SELECT category
FROM CustomerBehavior
GROUP BY category
ORDER BY COUNT(category) DESC
LIMIT 3;
`
        );
        return result[0]; 
      }
      return result[0];
    } catch (error) {
      console.error("Database query failed:", error);
      throw error;
    }
  },

  getNewCategory: async (customerID) => {
    try {
      const result = await pool.query(
        `SELECT category
         FROM CustomerBehavior
         WHERE id = (
           SELECT MAX(id)
           FROM CustomerBehavior
           WHERE customer_id = ?
         )`, 
        [customerID]  // Truyền giá trị customerID vào câu truy vấn
      );
  
      return result[0];  // Trả về kết quả
    } catch (error) {
      console.error("Database query failed:", error);
      throw error;
    }
  }
  
  
}
module.exports = CustomerBehaviorModel;
