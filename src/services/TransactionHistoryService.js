const TransactionHistoryModels = require("../models/TransactionHistoryModel");
const Bills = require("../models/BillsModel");
const Customers = require("../models/CustomerModel");
const Order = require("../services/OrderService");

const TransactionHistory = {
  getTransactionHistory: async (customerID, typeTransactionHistory) => {
    let allOrderIdByCustomer =
      await TransactionHistoryModels.getOrderIDByCustomerID(customerID);
    let allBillIDByCustomer =
      await TransactionHistoryModels.getBillIDByCustomerID(customerID);

    const result = await Promise.all(
      allBillIDByCustomer.map(async (item) => {
        const paymentBills = await Bills.getAllBillByBillID(
          item.bill_id,
          typeTransactionHistory
        );


        // Kiểm tra paymentBills có phải là mảng không và có ít nhất một phần tử
        if (Array.isArray(paymentBills) && paymentBills.length > 0) {
          const inforPaymentBillID =
            await TransactionHistoryModels.getInforPaymentBillID(item.bill_id);
            

          // Kiểm tra inforPaymentBillID có phải là mảng không và có ít nhất một phần tử
          if (
            Array.isArray(inforPaymentBillID) &&
            inforPaymentBillID.length > 0
          ) {
            return paymentBills.map((paymentBills) => {
              return inforPaymentBillID.map((inforPaymentBillID) => ({
                payment_id: inforPaymentBillID.payment_id,
                bill_id: inforPaymentBillID.bill_id,
                customer_id: inforPaymentBillID.customer_id,
                payment_amount: inforPaymentBillID.payment_amount,
                payment_date: inforPaymentBillID.payment_date,
                payment_method: inforPaymentBillID.payment_method,
                status: inforPaymentBillID.status,
                img: inforPaymentBillID.img,
                bill_type: paymentBills.bill_type,
                thang_nam: paymentBills.thang_nam,
                created_at: paymentBills.created_at,
                end_date: paymentBills.end_date,
                updated_at: paymentBills.updated_at,
              }));
            });
          } else {
            return [];
          }
        } else {
          return [];
        }
      })
    );

    const result2 = await Promise.all(
      allOrderIdByCustomer.map(async (item) => {
        const paymentOrderID = await Order.getOrderDetailByOrderID(item.order_id);

        // Kiểm tra paymentOrderID có phải là mảng không và có ít nhất một phần tử
        if (Array.isArray(paymentOrderID) && paymentOrderID.length > 0) {
          const inforPaymentOrderID =
            await TransactionHistoryModels.getInforPaymentOrderID(
              item.order_id
            );

          // Kiểm tra inforPaymentOrderID có phải là mảng không và có ít nhất một phần tử
          if (
            Array.isArray(inforPaymentOrderID) &&
            inforPaymentOrderID.length > 0
          ) {
            return paymentOrderID.map((paymentOrderID) => {
              return inforPaymentOrderID.map((inforPaymentOrderID) => ({
                payment_id: inforPaymentOrderID.payment_id,
                order_id: inforPaymentOrderID.order_id,
                customer_id: inforPaymentOrderID.customer_id,
                payment_amount: inforPaymentOrderID.payment_amount,
                payment_date: inforPaymentOrderID.payment_date,
                payment_method: inforPaymentOrderID.payment_method,
                status: inforPaymentOrderID.status,
                img: inforPaymentOrderID.img,
                discount: paymentOrderID.discount,
                TotalAmount: paymentOrderID.TotalAmount,
                VoucherID: paymentOrderID.VoucherID,
                created_at: paymentOrderID.CreateAt,
                address: paymentOrderID.address,
              }));
            });
          } else {
            return [];
          }
        } else {
          return [];
        }
      })
    );

    return [...result.flat(), ...result2.flat()];
  },

  addBillPayment: async (inforFullUser, item) => {
    const result1 = Customers.addCoinCustomer(inforFullUser, item);
    const result2 = TransactionHistoryModels.addPaymentBill(inforFullUser, item);
    const result3 = Bills.updateStatusBills(item.bill_id, item.bill_type);
    return { result1, result2, result3 };
  },
};

module.exports = TransactionHistory;
