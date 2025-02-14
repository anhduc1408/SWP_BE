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
            console.log("Dữ liệu nhận từ frontend:", req.body);
    
            const { customerID, houseAddress, area } = req.body;
    
            if (!customerID || !houseAddress || !area) {
                return res.status(400).json({ error: "Thiếu dữ liệu cần thiết" });
            }
    
            const result = await AddressService.addAddress(customerID, houseAddress, area);
            console.log("Dữ liệu lưu vào DB:", result);
    
            res.json(result);
        } catch (error) {
            console.error("Lỗi khi thêm địa chỉ:", error);
            res.status(500).json({ error: "Không thể thêm địa chỉ" });
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
            console.log("Nhận request xóa:", req.query);
            const { addressId, customerId } = req.query;
            const result = await AddressService.removeAddress(addressId, customerId);
            res.json(result);
        } catch (error) {
            console.error("Lỗi server:", error);
            res.status(500).json({ error: "Lỗi khi xóa địa chỉ" });
        }
    }
    
};

module.exports = AddressController;
