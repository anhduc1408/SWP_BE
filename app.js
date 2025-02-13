const express = require('express');
const cartRouter = require('./src/routers/CartRouter')
const app = express();
const cors = require('cors');

const port = 3001;
app.use(express.json());
app.use(cors());

app.use('/api/Cart',cartRouter)

// Cấu hình CORS
app.use(
  cors({
    origin: "*", // Chấp nhận tất cả các domain (không an toàn)
    methods: ["GET", "POST", "PUT", "DELETE", "PATCH"],
    allowedHeaders: ["Content-Type", "Authorization"],
    credentials: true,
  })
);


// Định tuyến API chính
app.use('/api/Order', orderRouter);
app.use('/api/Cart', cartRouter);
app.use('/api/Voucher', VoucherRouter);
app.use('/api/Products', Products);
app.use("/customers", CustomerRouter);

// **Thêm API nhận dữ liệu từ Admin**
app.use(bodyParser.json());
app.use('/api/customers', customerApiRouter);

// Cấu hình upload file
app.use("/uploads", express.static("src/uploads"));

// Khởi động server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
