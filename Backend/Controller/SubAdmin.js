const express = require('express');
const router = express.Router();
const {createSubAdmin , getSubAdmin , SubAdminLogin} = require('../Service/subAdminService');

router.post('/createSubAdmin', createSubAdmin);
router.post('/getSubAdmin', getSubAdmin);
router.post('/SubAdminLogin', SubAdminLogin);



module.exports = router;