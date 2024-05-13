const mongoose = require('mongoose');
const { menuItemSchema } = require("../Entity/Menu_Entity")

const saveMenuItem = async (req, res) => {
    try {
        const { uid, menuitem } = req.body;
        
        let DB = mongoose.connection.useDb("NukkadFoods");
        const MenuItem = DB.model('MenuItem', menuItemSchema);
        let existingMenuItem = await MenuItem.findOne({ uid });

        if (!existingMenuItem) {
            // If the menu item doesn't exist, create a new one
            existingMenuItem = new MenuItem({ uid: uid, menuitemlist: [] });
        }

        // Push the new menu item from the request body into the menu item list
        existingMenuItem.menuitemlist.push(menuitem);

        // Save the updated menu item to the database
        await existingMenuItem.save();

        // Respond with success message
        res.status(201).json({ message: 'Menu item added successfully' });
    } catch (error) {
        // If there's an error, respond with error message
        res.status(500).json({ error: error.message });
    }
}


const getMenuItems = async (req, res) => {
    try {
        const { uid } = req.params;
        
        let DB = mongoose.connection.useDb("NukkadFoods");
        const MenuItem = DB.model('MenuItem', menuItemSchema);
        let existingMenuItem = await MenuItem.findOne({ uid : uid });

        if (!existingMenuItem) {
           
            return res.status(404).json({ message: 'Menu items not found' });
        }

            
        return res.status(200).json({ menuItems: existingMenuItem.menuitemlist });
    } catch (error) {
        // If there's an error, respond with error message
        res.status(500).json({ error: error.message });
    }
}

module.exports = { saveMenuItem , getMenuItems};
