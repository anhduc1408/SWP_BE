const Notifications = require("../models/NotificationstModel");
const notificationsServices = {
  getAddNotifications: async (OrderInfor, voucher, totalPayment, cusID) => {
    const result = await Notifications.getAddNotifications(
      OrderInfor,
      voucher,
      totalPayment,
      cusID
    );
    return result;
  },

  getAllNotifications: async (req, res) => {
    try {
      const result = await Notifications.getAllNotifications(req, res);
      return result;
    } catch (err) {
      console.log(err);
    }
  },

  getStatusNotifications : async (req, res) => {
    try {
      const result = await Notifications.getStatusNotifications(req, res);
      return result;
    } catch (err) {
      console.log(err);
    }
  },
};
module.exports = notificationsServices;
