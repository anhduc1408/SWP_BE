const VoucherService = require('../services/VoucherService');

const Voucher = {
    getVoucherByCusID: async(req,res)=>{
        const cusID = req.body.cusID;
        const totalPrice = req.body.totalPrice;
        const result = await VoucherService.getVoucherByCusID(cusID,totalPrice);
        res.json(result)
    }
}

module.exports = Voucher;