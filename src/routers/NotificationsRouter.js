const notificationsControllers = require('../controllers/NotificationsControllers');
const express = require('express')

const router = express.Router();
router.get('/',notificationsControllers.getAllNotifications);
router.get('/notifications_status',notificationsControllers.getStatusNotifications);


module.exports = router;
