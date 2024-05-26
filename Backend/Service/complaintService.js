const { complaintDB } = require('../Entity/Complaint_Entity');

const addComplaint = async (req, res) => {
    try {
        const { restaurantID, status, orderID, description, complaintByID, designation } = req.body;

        let existingComplaintDB = await complaintDB.findOne({ restaurantID });

        if (!existingComplaintDB) {
            existingComplaintDB = new complaintDB({ restaurantID, complaints: [] });
        }

        existingComplaintDB.complaints.push({ status, orderID, description, complaintByID, designation });
        await existingComplaintDB.save();

        res.status(201).json({ message: 'Complaint added successfully', complaint: existingComplaintDB.complaints[existingComplaintDB.complaints.length - 1] });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const getComplaintsByRestaurantID = async (req, res) => {
    try {
        const { restaurantID } = req.params;
        const complaintData = await complaintDB.findOne({ restaurantID });

        if (!complaintData) {
            return res.status(404).json({ error: "Complaint database not found" });
        }

        res.status(200).json({ complaints: complaintData.complaints, status: "success" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const updateComplaint = async (req, res) => {
    try {
        const { restaurantID, complaintID } = req.params;
        const { status, description } = req.body;

        const complaintData = await complaintDB.findOne({ restaurantID });

        if (!complaintData) {
            return res.status(404).json({ error: "Complaint database not found" });
        }

        const complaint = complaintData.complaints.id(complaintID);
        if (!complaint) {
            return res.status(404).json({ error: "Complaint not found" });
        }

        if (status) complaint.status = status;
        if (description) complaint.description = description;

        await complaintData.save();

        res.status(200).json({ message: 'Complaint updated successfully', updatedComplaint: complaint });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const deleteComplaint = async (req, res) => {
    try {
        const { restaurantID, complaintID } = req.params;
        const complaintData = await complaintDB.findOne({ restaurantID });

        if (!complaintData) {
            return res.status(404).json({ error: "Complaint database not found" });
        }

        const complaintIndex = complaintData.complaints.findIndex(complaint => complaint._id.toString() === complaintID);
        if (complaintIndex === -1) {
            return res.status(404).json({ error: "Complaint not found" });
        }

        complaintData.complaints.pull({ _id: complaintID });
        await complaintData.save();

        res.status(200).json({ message: 'Complaint deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};



module.exports = { addComplaint, getComplaintsByRestaurantID, updateComplaint, deleteComplaint };
