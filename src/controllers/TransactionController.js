const Order = require('../services/OrderService')
const crypto = require('crypto')
const axios = require('axios')
require('dotenv').config();

const Transaction = {
    callback: async(req,res)=>{
        
        console.log("3564747: ", req.body.extraData);
        console.log("OrderID: ", OrderID);
        console.log("OrderInfor: ", OrderInfor);
        console.log("totalPayment: ", totalPayment);
        console.log("cusID: ", cusID);
        await Order.changeStatusShip(OrderInfor, totalPayment, cusID, OrderID);
    },
    
    checkPayment: async(req,res)=>{
        try {
            const orderId = req.body.extra;
            const rawSignature = `accessKey=${process.env.MOMO_ACCESSKEY}&orderId=${orderId}&partnerCode=MOMO&requestId=${orderId}`;
            const signature = crypto.createHmac("sha256",process.env.MOMO_SECRETKEY).update(rawSignature).digest('hex');
            const requestBody = JSON.stringify({
                partnerCode: 'MOMO',
                requestId: orderId,
                orderId:orderId,
                lang: 'vi',
                signature
            })
             const result = await axios.post('https://test-payment.momo.vn/v2/gateway/api/query',requestBody,{headers:{
                'Content-Type': 'application/json',
             }})
             res.status(200).json(result.data)
        } catch (error) {
            console.log(error);
        }
    }
}

module.exports = Transaction;