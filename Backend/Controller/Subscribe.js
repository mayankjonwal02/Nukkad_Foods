const express = require('express');
const router = express.Router();

const { subscribe, getSubscription, updateSubscription } = require("../Service/SubscribeService");

router.post('/subscribe', subscribe);
router.get('/subscribe/:restaurantId', getSubscription);
router.put('/subscribe', updateSubscription);

module.exports = router;

