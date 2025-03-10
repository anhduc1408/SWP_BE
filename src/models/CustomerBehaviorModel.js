const pool = require('../config/Database');

const CustomerBehaviorModel =  {
    addCustomerBehavior: async(cusID, productID, category, type, shopID)=>{
        const query = `
        INSERT INTO CustomerBehavior (customer_id, product_id, category, action_type, created_at, shop_ID) 
        VALUES (?, ?, ?, ?, NOW(), ?)
    `;
    
    const result = await pool.query(query, [cusID, productID, category, type, shopID]);
    return result[0]; // Trả về kết quả của query
    },

    getCategoryByShop: async (customerID, shopID) => {
        try {
          // Query for categories based on customerID and shopID, ordered by created_at and limited to 10
          let result = await pool.query(
            `SELECT category FROM CustomerBehavior 
                    WHERE customer_id = ? AND shop_ID = ? 
                    ORDER BY created_at DESC 
                    LIMIT 5`,
            [customerID, shopID]
          );
    
          if (result.length === 0) {
            result = await pool.query(
              `SELECT category FROM CustomerBehavior 
                        WHERE customer_id = ? 
                        ORDER BY created_at DESC 
                        LIMIT 5`,
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
}

module.exports = CustomerBehaviorModel;