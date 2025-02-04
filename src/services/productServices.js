const Products = require('../models/productModel');

const productServices = {
    getAllProducts: async (option, type)=>{
        console.log(123);
        const result = await Products.getAllProducts(option, type);
         console.log(result);
        return result;
    }
}
module.exports = productServices;