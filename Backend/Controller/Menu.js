const express = require('express');
const router = express.Router();
const {saveMenuItem , getMenuItems , updateMenuItem} = require('../Service/MenuService');


router.post('/saveMenuItem', saveMenuItem);
router.get('/getMenuItem/:uid', getMenuItems);
router.put('/updateMenuItem/:uid/:menuitemid', updateMenuItem);

module.exports = router;