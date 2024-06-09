const express = require('express');
const router = express.Router();

const { sendSMS, sendOtp, verifyOtp } = require('../Service/smsService');

router.post('/sendSMS', sendSMS);

router.post('/sendOtp', sendOtp);

router.post('/verifyOtp', verifyOtp);

module.exports = router;
