const NotificationsServices = require("../services/NotificationsService");

const NotificationsControllers = {
  getAddNotifications: async (req, res) => {
    try {
      const OrderInfor = req.body.OrderInfor;
      const voucher = req.body.voucherChoose;   
      const totalPayment = req.body.totalPayment;
      const cusID = req.body.cusID;
      const result = await NotificationsServices.getAddNotifications(OrderInfor, voucher, totalPayment, cusID);
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },

  getAllNotifications: async (req, res) => {
    try {
      const result = await NotificationsServices.getAllNotifications(req, res);
      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },

  getStatusNotifications: async (req, res) => {
    try {
      const result = await NotificationsServices.getStatusNotifications(req, res);
      
      res.status(200).json(result);
    } catch (err) {
      console.log(err);
    }
  },
};
module.exports = NotificationsControllers;
