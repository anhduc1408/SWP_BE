const OrderServices = require('../services/OrderService');

const OrderControllers = {
    getAllOrrders:async(req,res)=>{
        try {
            const result = await OrderServices.getAllOrder();
            res.status(200).json(result[0])
        } catch (error) {
            res.status(500).json(error)
        }
    },
    getOrderByCusID:async(req,res)=>{
        try {
            const cusID = req.body.cusID;
            const result = await OrderServices.getOrderByCusID(cusID);
            res.status(200).json(result[0]);
        } catch (error) {
            res.status(500).json(error);
        }
    },
    addOrder: async(req,res)=>{
        try {
            const OrderInfor = req.body.OrderInfor;
            const voucher = req.body.voucherChoose;   
            const totalPayment = req.body.totalPayment;
            const cusID = req.body.cusID;
            await OrderServices.addOrder(OrderInfor,voucher,totalPayment,cusID);
            const result = 'success';
            res.status(200).json(result);
        } catch (error) {
            console.log(error)
            res.status(500).json(error);
        }
    }
}
module.exports = OrderControllers;