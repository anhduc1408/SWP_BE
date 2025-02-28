const ProductFavoriteModel = require('../models/ProductFavoriteModel');

const ProductFavoriteService = {
    
    postAddProductIDTym: async (customerID, categoryLove, productIDTym) => {
        const result = await ProductFavoriteModel.postAddProductIDTym(customerID, categoryLove, productIDTym);
        console.log(188622);

        return result;
    }
};


module.exports = ProductFavoriteService;