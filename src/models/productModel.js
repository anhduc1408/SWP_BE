const pool  = require('../config/Database');
const Products = {
    getAllProducts:async(option, type)=>{
        if(option ==="Tất Cả"){
            if(type ==="New"){
                console.log(123);
                const result = await pool.query('SELECT * FROM Product ORDER BY ProductID DESC LIMIT 10')
                console.log();
                return result;
            }
        }
        console.log(option, type);
    }
}
module.exports = Products;