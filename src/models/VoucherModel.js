const pool = require('../config/Database');

const Voucher =  {
    getVoucherByID:async(cusID,totalPrice) =>{
        const result = await pool.query('select * from Voucher where VoucherID in (select VoucherID from VoucherDetail where CustomerID = ?) and validate <= ?', [cusID,totalPrice]);
        return result[0];
    },
    removeVoucherDetail: async(cusID,voucher)=>{
        const result = await pool.query('delete from VoucherDetail where CustomerID = ? and VoucherID = ?',[cusID,voucher]);
        return result;
    }
}

module.exports = Voucher