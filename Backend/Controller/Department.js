const express = require('express');
const router = express.Router();
const {addDepartment,getDepartment,deleteDepartment,updateDepartment,getDepartmentByName} = require('../Service/DepartmentService');

router.post('/addDepartment', addDepartment);
router.get('/getDepartments', getDepartment);
router.delete('/deleteDepartment', deleteDepartment);
router.post('/updateDepartment', updateDepartment);
router.post('/getDepartmentByName', getDepartmentByName);


module.exports = router;