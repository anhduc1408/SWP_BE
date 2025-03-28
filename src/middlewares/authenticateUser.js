const authenticateUser = (req, res, next) => {
    if (!req.user) {
        return res.status(401).json({ error: "Bạn cần đăng nhập để thực hiện hành động này!" });
    }
    next();
}

module.exports = authenticateUser;