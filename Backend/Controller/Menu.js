const express = require('express');
const router = express.Router();
const {saveMenuItem , getMenuItems , updateMenuItem , deleteMenuItem , addcategory , fetchAllCategories , deleteCategory , addSubCategory , fetchAllSubCategories , deleteSubCategory} = require('../Service/MenuService');



router.post('/fetchAllCategories', fetchAllCategories);
router.post('/addcategory', addcategory);
router.post('/deleteCategory', deleteCategory);
router.post('/fetchAllSubCategories', fetchAllSubCategories);
router.post('/addSubCategory', addSubCategory);
router.post('/deleteSubCategory', deleteSubCategory);
router.post('/saveMenuItem', saveMenuItem);
router.post('/getMenuItem/:uid', getMenuItems);
router.put('/updateMenuItem/:uid/:category/:subCategory/:menuitemid', updateMenuItem);
router.post('/deleteMenuItem/:uid/:category/:subCategory/:menuitemid', deleteMenuItem);

module.exports = router;