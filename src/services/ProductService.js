const Products = require('../models/ProductModel');
const productServices = {
    getAllProductsNew: async (option, type)=>{
        const result = await Products.getAllProductsNew(option, type);
        return result;
    },

    getAllProducts: async (option)=>{
        const result = await Products.getAllProducts(option);
        return result;
    },

    getAllCategory: async ()=>{
        const result = await Products.getAllCategory();
        return result;
    },
    searchProduct: async (categoryName, pageIndex,keyword)=>{
        const result = await Products.searchProduct(categoryName, pageIndex,keyword);

        return result;
    }
}
module.exports = productServices;