const express = require('express');
const router = express.Router();


const {createOrder,verifyPayment,createPayout} = require('../Service/RazorPayService');

router.post('/createOrder', createOrder);

router.post('/verifyPayment', verifyPayment);

router.post('/createPayout', createPayout);

module.exports = router;