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
  getProductByID: async (req,res)=>{
    try {
      const proID = req.body.productID;
      const result = await productServices.getProductByID(proID);
      res.status(200).json(result);
    } catch (error) {
      console.log(error)
    }
  },
  getFavoriteByCusID: async(req,res)=>{
    try {
      const cusID = req.body.cusID;
      const result = await productServices.getFavoriteByCusID(cusID);
      res.status(200).json(result);
    } catch (error) {
      console.log(error)
    }
    
  }
};
module.exports = productControllers;
