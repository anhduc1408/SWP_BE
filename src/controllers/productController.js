const productServices = require('../services/productServices');

const productControllers = {
    getAllProducts:async(req,res)=>{
            console.log(req.body);
            const option = req.body.option;
            const type = req.body.type;
            console.log(option,type);
            const result = await productServices.getAllProducts(option, type);
            res.status(200).json(result)
    }
}
module.exports = productControllers;