const mongoose = require('mongoose');
const {Adds} = require('../Entity/Adds_Entity');


const addAdds = async (req, res) => {
    try {
        const {restaurantId, amount, startDate, endDate} = req.body;

        const newAdd = new Adds({restaurantId, amount, startDate, endDate});
        await newAdd.save();
        res.status(201).send(newAdd);
    } catch (e) {
        res.status(400).send(e);
    }
};

const getAdds = async (req, res) => {
    try {
        const restaurantId = req.params.restaurantId;
        const adds = await Adds.find({restaurantId});
        if (!adds) {
            return res.status(404).send();
        }
        res.json({"adds":adds, "status": "success"});

    }
    catch (e) {
        res.status(500).send(e);
    }
}

const updateAdds = async (req, res) => {
    try {
        const {restaurantId, amount, startDate, endDate} = req.body;
        const adds = await Adds.findOneAndUpdate({restaurantId}, {amount, startDate, endDate}, {new: true});
        if (!adds) {
            return res.status(404).send();
        }
        res.json({"adds":adds, "status": "success"});
    }
    catch (e) {
        res.status( 500).send(e);
    }
}

const deleteAdds = async (req, res) => {
    try {
        const restaurantId = req.params.restaurantId;
        const adds = await Adds.findOneAndDelete({restaurantId});
        if (!adds) {
            return res.status(404).send();
        }
        res.json({"adds":adds, "status": "success"});
    }
    catch (e) {
        res.status(500).send(e);
    }
}

module.exports = {addAdds, getAdds, updateAdds, deleteAdds};