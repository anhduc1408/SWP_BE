const notificationsControllers = require('../controllers/NotificationsControllers');
const express = require('express')

const router = express.Router();

router.get('/notifications',notificationsControllers.getAllNotifications);


module.exports = router;
