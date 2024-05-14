const express = require('express');
const router = express.Router();
const {saveMenuItem , getMenuItems , updateMenuItem , deleteMenuItem} = require('../Service/MenuService');


router.post('/saveMenuItem', saveMenuItem);
router.get('/getMenuItem/:uid', getMenuItems);
router.put('/updateMenuItem/:uid/:menuitemid', updateMenuItem);
router.delete('/deleteMenuItem/:uid/:menuitemid', deleteMenuItem);

module.exports = router;