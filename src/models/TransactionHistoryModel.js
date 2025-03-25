const pool = require("../config/Database");

const TransactionHistoryModels = {
  getOrderIDByCustomerID: async (customerID) => {
    const result = await pool.query(
      "SELECT order_id FROM Payments WHERE customer_id = ? AND order_id IS NOT NULL GROUP BY order_id ORDER BY MAX(payment_date) DESC;",
      [customerID]
    );
    return result[0];
  },

  addPaymentBill: async (inforFullUser, item) => {
    console.log(222);
    const payment_date = new Date()
      .toISOString()
      .slice(0, 19)
      .replace("T", " ");
    const status = "Thành công";

    let result;

    if (item.bill_type === "Điện") {
      const result = await pool.query(
        "INSERT INTO Payments (bill_id, customer_id, payment_amount, payment_date, payment_method, status, order_id, img) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [
          item.bill_id,
          item.customer_id,
          item.bill_amount,
          payment_date,
          "Quét Mã QR",
          status,
          null,
          "https://res.cloudinary.com/div6eqrog/image/upload/v1742039025/14042023_LogoEVN_Ngang_FULL_hffmxx.jpg",
        ]
      );
    } else if (item.bill_type === "Nước") {
      const result = await pool.query(
        "INSERT INTO Payments (bill_id, customer_id, payment_amount, payment_date, payment_method, status, order_id, img) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [
          item.bill_id,
          item.customer_id,
          item.bill_amount,
          payment_date,
          "Quét Mã QR",
          status,
          null,
          "https://res.cloudinary.com/div6eqrog/image/upload/v1742038973/83c2446a0896df0a1f4af01c940ae1d9_M_gnz8o1.jpg",
        ]
      );
    } else if (item.bill_type === "Mạng") {
      const result = await pool.query(
        "INSERT INTO Payments (bill_id, customer_id, payment_amount, payment_date, payment_method, status, order_id, img) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [
          item.bill_id,
          item.customer_id,
          item.bill_amount,
          payment_date,
          "Quét Mã QR",
          status,
          null,
          "https://res.cloudinary.com/div6eqrog/image/upload/v1742038809/65532ba4b0900_mang-fpt_pfqunw.png",
        ]
      );
    }

    return result;
  },

  getBillIDByCustomerID: async (customerID) => {
    const result = await pool.query(
      "SELECT DISTINCT bill_id FROM Payments WHERE customer_id = ?;",
      [customerID]
    );
    return result[0];
  },

  getInforPaymentBillID: async (bill_id) => {
    const result = await pool.query(
      "SELECT * FROM Payments WHERE bill_id = ?;",
      [bill_id]
    );
    return result[0];
  },

  getInforPaymentOrderID: async (order_id) => {
    const result = await pool.query(
      "SELECT * FROM Payments WHERE order_id = ?;",
      [order_id]
    );
    return result[0];
  },

  addOrder: async (OrderInfor, totalPayment, cusID, OrderID) => {
    const payment_date = new Date()
      .toISOString()
      .slice(0, 19)
      .replace("T", " ");
    const status = "Thành công";

    console.log("OrderID: ", OrderID[0].OrderID);

    // Lặp qua từng phần tử trong mảng OrderInfor
    const result = await pool.query(
      "INSERT INTO Payments (bill_id, customer_id, payment_amount, payment_date, payment_method, status, order_id, img) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      [
        null,
        cusID,
        totalPayment,
        payment_date,
        "Quét Mã QR",
        status,
        OrderID[0].OrderID,
        OrderInfor.productImg,
      ]
    );

    return result;
  },
};

module.exports = TransactionHistoryModels;
