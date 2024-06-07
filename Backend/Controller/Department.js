const express = require('express');
const router = express.Router();
const {addDepartment,getDepartment,deleteDepartment} = require('../Service/DepartmentService');

router.post('/addDepartment', addDepartment);
router.get('/getDepartment', getDepartment);
router.delete('/deleteDepartment', deleteDepartment);


module.exports = router;