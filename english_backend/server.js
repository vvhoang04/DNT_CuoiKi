const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const connectDB = require('./config/db');

// --- IMPORT CÁC ROUTES ---
const authRoute = require('./routes/auth');
const userRoute = require('./routes/user'); // <--- MỚI THÊM: Import file user.js

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

connectDB();

// --- KHAI BÁO SỬ DỤNG ROUTES ---
app.use('/api/auth', authRoute);
app.use('/api/user', userRoute); // <--- MỚI THÊM: Đường dẫn cho user profile

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));