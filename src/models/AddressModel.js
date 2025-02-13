const pool = require('../config/Database');

const AddressModel = {
    getAddressByCustomerId: async (customerID) => {
        const [rows] = await pool.query("SELECT * FROM address WHERE CustomerID = ?", [customerID]);
        return rows;
    },

    addAddress: async (customerID, houseAddress, area) => {
        const [result] = await pool.query(
            "INSERT INTO address (CustomerID, HouseAddress, Area) VALUES (?, ?, ?)",
            [customerID, houseAddress, area]
        );
        return { addressID: result.insertId };
    },

    updateAddressById: async (addressID, addressData) => {
        try {
            const [oldAddressQuery] = await pool.query(
                'SELECT * FROM address WHERE AddressID = ?', [addressID]
            );
            const oldAddress = oldAddressQuery[0];
    
            if (!oldAddress) {
                throw new Error('Địa chỉ không tồn tại');
            }
    
            const updatedAddress = {
                HouseAddress: addressData.HouseAddress || oldAddress.HouseAddress,
                Area: addressData.Area || oldAddress.Area,
            };
    
            await pool.query(
                'UPDATE address SET HouseAddress = ?, Area = ? WHERE AddressID = ?',
                [updatedAddress.HouseAddress, updatedAddress.Area, addressID]
            );
    
            return { success: true, message: "Cập nhật địa chỉ thành công" };
        } catch (error) {
            console.error("Lỗi khi cập nhật địa chỉ:", error);
            return { success: false, message: "Lỗi khi cập nhật địa chỉ" };
        }
    },
    
    removeAddress: async (addressID, customerID) => {
        const [countResult] = await pool.query(
            "SELECT COUNT(*) AS count FROM address WHERE CustomerID = ?", 
            [customerID]
        );

        if (countResult[0].count <= 1) {
            return { success: false, message: "Khách hàng phải có ít nhất một địa chỉ" };
        }

        const [result] = await pool.query("DELETE FROM address WHERE AddressID = ?", [addressID]);

        if (result.affectedRows === 0) {
            return { success: false, message: "Không tìm thấy địa chỉ để xóa" };
        }

        return { success: true, message: "Địa chỉ đã được xóa" };
    }
};

module.exports = AddressModel;
