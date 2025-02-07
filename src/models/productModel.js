const pool = require("../config/Database");
const Products = {
  getAllProductsNew: async (option, type) => {
    if (option === "Tất Cả") {
      if (type === "Mới Nhất") {
        const result = await pool.query(
          "SELECT * FROM Product ORDER BY ProductID DESC LIMIT 15"
        );
        return result;
      } else if (type === "Rẻ Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product ORDER BY Price ASC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Đắt Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product ORDER BY Price DESC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Bán Chạy Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product ORDER BY SoldQuantity DESC LIMIT 15"
        );
        console.log();
        return result;
      }
    } else if (option === "Đồ Ăn") {
      if (type === "Mới Nhất") {
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn' ORDER BY ProductID DESC LIMIT 15"
        );
        return result;
      } else if (type === "Rẻ Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn' ORDER BY Price ASC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Đắt Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn' ORDER BY Price DESC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Bán Chạy Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn' ORDER BY SoldQuantity DESC LIMIT 15"
        );
        console.log();
        return result;
      }
    } else if (option === "Đồ Ăn Chay") {
      if (type === "Mới Nhất") {
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn Chay' ORDER BY ProductID DESC LIMIT 15"
        );
        return result;
      } else if (type === "Rẻ Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn Chay' ORDER BY Price ASC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Đắt Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn Chay' ORDER BY Price DESC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Bán Chạy Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Ăn Chay' ORDER BY SoldQuantity DESC LIMIT 15"
        );
        console.log();
        return result;
      }
    } else if (option === "Đồ Uống") {
      if (type === "Mới Nhất") {
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Uống' ORDER BY ProductID DESC LIMIT 15"
        );
        return result;
      } else if (type === "Rẻ Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Uống' ORDER BY Price ASC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Đắt Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Uống' ORDER BY Price DESC LIMIT 15"
        );
        console.log();
        return result;
      } else if (type === "Bán Chạy Nhất") {
        console.log(option, type);
        const result = await pool.query(
          "SELECT * FROM Product Where Category ='Đồ Uống' ORDER BY SoldQuantity DESC LIMIT 15"
        );
        console.log();
        return result;
      }
    }
  },

  getAllProducts: async (option) => {
    if (option === "Tất Cả") {
      const result = await pool.query("SELECT * FROM Product ORDER BY RAND()");
      return result;
    }else if(option === "Đồ Ăn"){
      const result = await pool.query("SELECT * FROM Product  Where Category ='Đồ Ăn' ORDER BY RAND()");
      return result;
    }else if(option === "Đồ Ăn Chay"){
      const result = await pool.query("SELECT * FROM Product  Where Category ='Đồ Ăn Chay' ORDER BY RAND()");
      return result;
    }else if(option === "Đồ Uống"){
      const result = await pool.query("SELECT * FROM Product  Where Category ='Đồ Uống' ORDER BY RAND()");
      return result;
    }
  },

  getAllCategory: async () => {
    const result = await pool.query("SELECT DISTINCT Category FROM Product");
    return result;
  },
};
module.exports = Products;
