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
    },

    setProductFavorite: async (CustomerID,ProductID)=>{
        const result = await Products.setProductFavorite(CustomerID,ProductID);

        return result;
    },
    getProductFavorite: async (CustomerID)=>{
        const result = await Products.getProductFavorite(CustomerID);

        return result;
    }
}
module.exports = productServices;