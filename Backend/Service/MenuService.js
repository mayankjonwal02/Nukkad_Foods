const mongoose = require('mongoose');
const { menuItemSchema } = require("../Entity/Menu_Entity")

const saveMenuItem = async (req, res) => {
    try {
        const { uid, category, subCategory, menuItem } = req.body;

        let DB = mongoose.connection.useDb("NukkadFoods");
        const MenuItem = DB.model('MenuItem', menuItemSchema);
        MenuItem.createCollection();
        let existingMenuItem = await MenuItem.findOne({ uid });

        if (!existingMenuItem) {
            existingMenuItem = new MenuItem({ uid, menuItemList: [] });
            await existingMenuItem.save();
        }
        existingMenuItem = await MenuItem.findOne({ uid });
        let categoryObj = existingMenuItem.menuItemList.find(cat => cat.category === category);

        if (!categoryObj) {
            categoryObj = { category: category, subCategory: [] };
            existingMenuItem.menuItemList.push(categoryObj);
            // Debugging statement
            console.log('New categoryObj created and pushed:', categoryObj);
            await existingMenuItem.save()
        }
        existingMenuItem = await MenuItem.findOne({ uid });
        categoryObj = existingMenuItem.menuItemList.find(cat => cat.category === category);
        let subCategoryObj = categoryObj.subCategory.find(subCat => subCat.subCategoryName === subCategory);

        if (!subCategoryObj) {
            subCategoryObj = { subCategoryName: subCategory, menuItems: [] };
            categoryObj.subCategory.push(subCategoryObj);
            // Debugging statement
            console.log('New subCategoryObj created and pushed:', subCategoryObj);
            await existingMenuItem.save()
        }
        existingMenuItem = await MenuItem.findOne({ uid });
        categoryObj = existingMenuItem.menuItemList.find(cat => cat.category === category);
        subCategoryObj = categoryObj.subCategory.find(subCat => subCat.subCategoryName === subCategory);
        subCategoryObj.menuItems.push(menuItem);
        // Debugging statement
        console.log('MenuItem pushed to subCategoryObj:', subCategoryObj);

        existingMenuItem.markModified('menuItemList');

        await existingMenuItem.save();
        return res.status(201).json({ message: 'Menu item added successfully', existingMenuItem });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};




const getMenuItems = async (req, res) => {
    try {
        const { uid, category, subCategory } = req.params;
        
        let DB = mongoose.connection.useDb("NukkadFoods");
        const MenuItem = DB.model('MenuItem', menuItemSchema);
        let existingMenuItem = await MenuItem.findOne({ uid });

        if (!existingMenuItem) {
            return res.status(404).json({ message: 'Menu items not found' });
        }

        // If category and subCategory are provided
        if (category && subCategory) {
            const categoryObj = existingMenuItem.menuItemList.find(cat => cat.category === category);
            if (!categoryObj) {
                return res.status(404).json({ message: 'Category not found' });
            }

            const subCategoryObj = categoryObj.subCategory.find(subCat => subCat.subCategoryName === subCategory);
            if (!subCategoryObj) {
                return res.status(404).json({ message: 'Subcategory not found' });
            }

            return res.status(200).json({ menuItems: subCategoryObj.menuItems });
        }

        // If only category is provided
        if (category) {
            const categoryObj = existingMenuItem.menuItemList.find(cat => cat.category === category);
            if (!categoryObj) {
                return res.status(404).json({ message: 'Category not found' });
            }

            return res.status(200).json({ subCategories: categoryObj.subCategory });
        }

        // If neither category nor subCategory is provided, return the full menuItemList
        res.status(200).json({ menuItems: existingMenuItem.menuItemList });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}


const updateMenuItem = async (req, res) => { 
    try {
        const { uid, category, subCategory, menuitemid } = req.params;
        const { updatedata } = req.body;
        
        const db = mongoose.connection.useDb("NukkadFoods");
        const MenuItem = db.model('MenuItem', menuItemSchema);
        const existingMenuItem = await MenuItem.findOne({ uid });

        if (!existingMenuItem) {
            return res.status(404).json({ message: "Menu item not found" });
        }

        const categoryObj = existingMenuItem.menuItemList.find(cat => cat.category === category);
        if (!categoryObj) {
            return res.status(404).json({ message: "Category not found" });
        }

        const subCategoryObj = categoryObj.subCategory.find(subCat => subCat.subCategoryName === subCategory);
        if (!subCategoryObj) {
            return res.status(404).json({ message: "SubCategory not found" });
        }

        const menuItem = subCategoryObj.menuItems.find(item => item._id.toString() === menuitemid);
        if (!menuItem) {
            return res.status(404).json({ message: "Menu item not found" });
        }

        for (let key in updatedata) {
            menuItem[key] = updatedata[key];
        }

        await existingMenuItem.save();
        return res.status(200).json({ message: "Menu item updated successfully" });

    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}


const deleteMenuItem = async (req, res) => {
    try {
        const { uid, category, subCategory, menuitemid } = req.params;

        const db = mongoose.connection.useDb("NukkadFoods");
        const MenuItem = db.model('MenuItem', menuItemSchema);
        const existingMenuItem = await MenuItem.findOne({ uid });

        if (!existingMenuItem) {
            return res.status(404).json({ message: "Menu item not found" });
        }

        const categoryObj = existingMenuItem.menuItemList.find(cat => cat.category === category);
        if (!categoryObj) {
            return res.status(404).json({ message: "Category not found" });
        }

        const subCategoryObj = categoryObj.subCategory.find(subCat => subCat.subCategoryName === subCategory);
        if (!subCategoryObj) {
            return res.status(404).json({ message: "SubCategory not found" });
        }

        const index = subCategoryObj.menuItems.findIndex(item => item._id.toString() === menuitemid);
        if (index === -1) {
            return res.status(404).json({ message: "Menu item not found" });
        }

        subCategoryObj.menuItems.splice(index, 1);
        await existingMenuItem.save();

        return res.status(200).json({ message: "Menu item deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { saveMenuItem, getMenuItems, updateMenuItem, deleteMenuItem };



