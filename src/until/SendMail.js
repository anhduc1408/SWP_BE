import nodemailer from "nodemailer";

//config smtp
const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: "nghiadphe180494@fpt.edu.vn",
        pass: "ukua onvl uhdk bzfr",
    },
});

export const sendEmail = async (mailInfo) => {
    const { to, subject, text } = mailInfo;

    try {
        const mailOptions = {
            from: "nghiadphe180494@fpt.edu.vn",
            to,
            subject,
            text,
        };

        await transporter.sendMail(mailOptions);
        console.log("mail sent successfully");
    } catch (err) {
        console.log("mail sent faled: ", err);
        throw err;
    }
};



