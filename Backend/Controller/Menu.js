const express = require('express');
const router = express.Router();
const {saveMenuItem , getMenuItems} = require('../Service/MenuService');


router.post('/saveMenuItem', saveMenuItem);
router.get('/getMenuItem/:uid', getMenuItems);
module.exports = router;