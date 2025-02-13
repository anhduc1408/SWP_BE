const VoucherModel = require('../models/VoucherModel');

const Voucher = {
    getVoucherByCusID: async(cusID,totalPrice)=>{
        const result = await VoucherModel.getVoucherByID(cusID,totalPrice);
        return result
    },
    removeVoucherDetail:async(cusID,voucher)=>{
        await Promise.all(voucher.map(async(item)=>{
            if(item.Discount !== 0){
                await VoucherModel.removeVoucherDetail(cusID,item);
            }
        }))
    },
    getVoucherByShopID: async(shop)=>{
        const result =  Promise.all(shop.map(async(item)=>{
            return await VoucherModel.getVoucherByShopID(item);
            
        }))
        return result;
    }
}

module.exports = Voucher;