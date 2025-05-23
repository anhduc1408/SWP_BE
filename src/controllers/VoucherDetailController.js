const VoucherDetailService = require("../services/VoucherDetailService");

const VoucherDetailController = {
  postSaveVoucherID: async (req, res) => {
    try {
      const customerID = req.body.customerID;
      const saveVoucherID = req.body.saveVoucherID;
      const result = await VoucherDetailService.postSaveVoucherID(
        customerID,
        saveVoucherID
      );
      console.log(result)
      res.status(200).json(result);
    } catch (error) {
      console.log(error);
    }
  },

  deleteVoucherID: async (req, res) => {
    try {
      const customerID = req.query.customerID;
      const deleteVoucherID = req.query.deleteVoucherID;
      const result = await VoucherDetailService.deleteVoucherID(
        customerID,
        deleteVoucherID
      );
      res.status(200).json(result);
    } catch (error) {
      console.log(error);
    }
  },

  getListVoucherByCustomerID: async (req, res) => {
    try {
      const customerID = req.query.customerID;
      const result = await VoucherDetailService.getListVoucherByCustomerID(
        customerID
      );
      
      res.status(200).json(result);
    } catch (error) {
      console.log(error);
    }
  },
};

module.exports = VoucherDetailController;
