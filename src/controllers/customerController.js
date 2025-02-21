const CustomerServices = require("../services/customerService");

const CustomerControllers = {
  getAllCustomers: async (req, res) => {
    try {
      const result = await CustomerServices.getAllCustomers();
      const customers = result.map((customer) => ({
        ...customer,
        Avatar: customer.Avatar
          ? `${req.protocol}://${req.get("host")}/uploads/${customer.Avatar}`
          : null,
      }));
      res.status(200).json(customers);
    } catch (error) {
      res.status(500).json(error);
    }
  },

  getCustomerById: async (req, res) => {
    try {
      const { CustomerID } = req.params;
      const result = await CustomerServices.getCustomerById(CustomerID);

      if (result) {
        const customer = {
          ...result,
          Avatar: result.Avatar
            ? `${req.protocol}://${req.get("host")}/uploads/${result.Avatar}`
            : null,
        };

        console.log("customer: ", customer);
        res.status(200).json(customer);
      } else {
        res.status(404).json({ message: "Customer not found" });
      }
    } catch (error) {
      res.status(500).json({ message: "Internal server error", error });
    }
  },

  updateCustomerById: async (req, res) => {
    try {
      const { CustomerID } = req.params;
      const customerData = req.body;
      if (req.file) {
        customerData.Avatar = req.file.filename;
      }
      const result = await CustomerServices.updateCustomerById(
        CustomerID,
        customerData
      );
      res
        .status(200)
        .json({ message: "Customer updated successfully", result });
    } catch (error) {
      res.status(500).json(error);
    }
  },
};

module.exports = CustomerControllers;
