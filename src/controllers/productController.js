const productServices = require("../services/ProductService");

const productControllers = {
  getAllProductsNew: async (req, res) => {
    try {
      const option = req.query.option;
      const type = req.query.type;
      const result = await productServices.getAllProductsNew(option, type);
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },

  getAllProducts: async (req, res) => {
    try {
      const option = req.query.option;
      const result = await productServices.getAllProducts(option);
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },

  getAllCategory: async (req, res) => {
    try {
      const result = await productServices.getAllCategory();
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },

  searchProduct: async (req, res) => {
    const {categoryName, pageIndex,keyword} = req.body
    try {
      const result = await productServices.searchProduct(categoryName, pageIndex, keyword);      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },

  setProductFavorite: async (req, res) => {
    const {CustomerID,ProductID} = req.body
    try {
      const result = await productServices.setProductFavorite(CustomerID,ProductID);      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },
  getProductFavorite: async (req, res) => {
    const {CustomerId} = req.body
    try {
      const result = await productServices.getProductFavorite(CustomerId);      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },
  getProductsFavorite: async (req, res) => {
    const {CustomerID, pageIndex, keyword} = req.body
    try {
      const result = await productServices.getProductsFavorite(CustomerID, pageIndex, keyword);      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },
  deleteProductFavorite: async (req, res) => {
    const {CustomerID,ProductID} = req.body
    try {
      const result = await productServices.deleteProductFavorite(CustomerID,ProductID);      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },
  getProductDetail: async (req, res) => {
    const {productID} = req.body
    try {
      const result = await productServices.getProductDetail(productID);      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },
};
module.exports = productControllers;
