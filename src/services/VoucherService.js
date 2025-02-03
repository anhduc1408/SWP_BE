const VoucherModel = require('../models/VoucherModel');

const Voucher = {
    getVoucherByCusID: async(cusID,totalPrice)=>{
        const result = await VoucherModel.getVoucherByID(cusID,totalPrice);
        return result
    }
}

module.exports = Voucher;