const express = require('express');
const router = express.Router();

const {addComplaint, getComplaintsByRestaurantID, updateComplaint, deleteComplaint,getAllComplaints} = require('../Service/complaintService');

router.post('/addComplaint', addComplaint);
router.get('/getComplaint/:restaurantID', getComplaintsByRestaurantID);
router.put('/updateComplaint/:restaurantID/:complaintID', updateComplaint);
router.delete('/deleteComplaint/:restaurantID/:complaintID', deleteComplaint);
router.get('/getAllComplaints', getAllComplaints);

module.exports = router;

