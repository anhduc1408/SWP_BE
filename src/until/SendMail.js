const otpStore = new Map(); // Tạm thời lưu OTP

const sendOtpToEmail = (email) => {
    return new Promise((resolve, reject) => {
        const otp = Math.floor(100000 + Math.random() * 900000); // 6 chữ số

        otpStore.set(email, otp); // Lưu OTP vào Map

        const mailOptions = {
            from: 'nghiadphe180494@fpt.edu.vn',
            to: email,
            subject: 'Mã OTP xác nhận thay đổi email',
            text: `Mã OTP của bạn là: ${otp}`,
        };

        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                return reject(error);
            }
            resolve({ success: true, message: "OTP đã được gửi", otp });
        });
    });
};

module.exports = { sendOtpToEmail, otpStore };
