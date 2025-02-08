const VoucherService = require('../services/VoucherService');

const Voucher = {
    getVoucherByCusID: async(req,res)=>{
        try {
            const cusID = req.body.cusID;
        const totalPrice = req.body.totalPrice;
        const result = await VoucherService.getVoucherByCusID(cusID,totalPrice);
        res.status(200).json(result)
        } catch (error) {
            console.log(error)
        }
    }
}

module.exports = Voucher;