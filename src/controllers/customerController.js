const CustomerService = require('../services/CustomerService');

const Customer = async()=>{
    getCustomerByID:async(req,res)=>{
        try {
            const cusID = req.body.cusID;
            const result = await CustomerService.getCustomerByID(cusID);
            res.status(200).json(result[0]);
        } catch (error) {
            res.status(500).json(error);
        }
    }
}
module.exports = Customer;