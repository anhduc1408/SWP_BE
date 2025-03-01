const express = require('express');
const Products = require('./src/routers/productRouter')
const orderRouter = require('./src/routers/OrderRouter')
const cartRouter = require('./src/routers/CartRouter')
const VoucherRouter = require('./src/routers/VoucherRouter')
const CustomerRouter = require('./src/routers/CustomerRouter')
const Review = require('./src/routers/ReviewRouter')
const Shop = require('./src/routers/ShopRouter')
const cors = require('cors');
const bodyParser = require('body-parser');
const AddressRouter = require('./src/routers/AddressRouter');
const customerApiRouter = require('./src/routers/APICustomer'); // API mới
const NotificationsRouter = require('./src/routers/NotificationsRouter');
const SubItemRouter = require("./src/routers/SubItemRouter");
const categoryRouter = require("./src/routers/CategoryRouter");
const errorHandler = require("./src/middlewares/errorHandler");
const FAQRouter = require("./src/routers/FAQRouter");
const TransactionRouter = require("./src/routers/TransactionRouter")



const app = express();
const port = 3001;
app.use(express.json());
app.use(cors());
require('dotenv').config()


app.use('/api/Order',orderRouter)
app.use('/api/Cart',cartRouter)
app.use('/api/Voucher',VoucherRouter)
app.use('/api/Products', Products)
app.use('/api/Review',Review)

// Cấu hình CORS
app.use(
  cors({
    origin: "*", // Chấp nhận tất cả các domain (không an toàn)
    methods: ["GET", "POST", "PUT", "DELETE", "PATCH"],
    allowedHeaders: ["Content-Type", "Authorization"],
    credentials: true,
  })
);
console.log(process.env.DATABASE_USER)
app.use(express.json());
app.use(bodyParser.json());
app.use(cors());

// Định tuyến API
app.use('/api/Order', orderRouter);
app.use('/api/Cart', cartRouter);
app.use('/api/Voucher', VoucherRouter);
app.use('/api/Products', Products);
app.use("/customers", CustomerRouter);
app.use('/api/customers', customerApiRouter);
app.use('/address', AddressRouter);
app.use('/api/notifications', NotificationsRouter);
app.use("/api/subitems", SubItemRouter);
app.use("/api/categories", categoryRouter);
app.use("/api/faqs", FAQRouter);
app.use("/api/Transaction",TransactionRouter)
app.use("/api/shop", Shop);
app.use(errorHandler);
// Cấu hình upload file
app.use("/uploads", express.static("src/uploads"));

// Khởi động server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});