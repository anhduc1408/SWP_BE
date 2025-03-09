const pool = require('../config/Database');

const CustomerBehaviorModel =  {
    addCustomerBehavior: async(cusID, productID, category, type, shopID)=>{
        const query = `
        INSERT INTO CustomerBehavior (customer_id, product_id, category_id, action_type, created_at, shop_ID) 
        VALUES (?, ?, ?, ?, NOW(), ?)
    `;
    
    const result = await pool.query(query, [cusID, productID, category, type, shopID]);
    return result[0]; // Trả về kết quả của query
    }
}

module.exports = CustomerBehaviorModel