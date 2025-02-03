const pool = require('../config/Database');

const Voucher =  {
    getVoucherByID:async(cusID,totalPrice) =>{
        const result = await pool.query('select * from Voucher where VoucherID in (select VoucherID from VoucherDetail where CustomerID = ?) and validate <= ?', [cusID,totalPrice]);
        return result[0];
    }
}

module.exports = Voucher