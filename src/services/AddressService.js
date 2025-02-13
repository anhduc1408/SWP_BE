const Address = require('../models/AddressModel');

const AddressService = {
    getAddressByCustomerId: async (customerID) => {
        return await Address.getAddressByCustomerId(customerID);
    },

    addAddress: async (customerID, houseAddress, area) => {
        return await Address.addAddress(customerID, houseAddress, area);
    },

    updateAddressById: async (addressID, addressData) => {
        return await Address.updateAddressById(addressID, addressData);
    },

    removeAddress: async (addressID, customerID) => {
        return await Address.removeAddress(addressID, customerID);
    }
};

module.exports = AddressService;
