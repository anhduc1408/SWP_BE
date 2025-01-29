const CustomerModels = require('../models/CustomerModel')

const Customer = {
    getCustomerByID: async(cusID)=>{
        return await CustomerModels.getCustomerByID(cusID);
    }
}
module.exports = Customer;