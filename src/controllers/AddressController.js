const AddressService = require('../services/AddressService');

const AddressController = {
    getAddressByCustomerId: async (req, res) => {
        try {
            const customerID = req.params.customerID;
            const result = await AddressService.getAddressByCustomerId(customerID);
            res.json(result);
        } catch (error) {
            res.status(500).json({ error: "Lỗi khi lấy địa chỉ" });
        }
    },

    addAddress: async (req, res) => {
        try {
            const { customerID, houseAddress, area } = req.body;
            const result = await AddressService.addAddress(customerID, houseAddress, area);
            res.json(result);
        } catch (error) {
            res.status(500).json({ error: "Lỗi khi thêm địa chỉ" });
        }
    },

    updateAddressById: async (req, res) => {
        try {
            const addressID = req.params.addressID;
            const addressData = req.body;
            const result = await AddressService.updateAddressById(addressID, addressData);
            res.json(result);
        } catch (error) {
            res.status(500).json({ error: "Lỗi khi cập nhật địa chỉ" });
        }
    },

    removeAddress: async (req, res) => {
        try {
            const { addressID, customerID } = req.body;
            const result = await AddressService.removeAddress(addressID, customerID);
            res.json(result);
        } catch (error) {
            res.status(500).json({ error: "Lỗi khi xóa địa chỉ" });
        }
    }
};

module.exports = AddressController;
