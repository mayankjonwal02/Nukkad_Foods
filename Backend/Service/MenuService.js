const mongoose = require("mongoose");
const { menuItemSchema } = require("../Entity/Menu_Entity");



const addcategory = async (req, res) => {
  try {
    const { uid, category } = req.body;

    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid });

    if (!existingMenuItem) {
      existingMenuItem = new MenuItem({ uid, menuItemList: [] });
    }

    let categoryObj = existingMenuItem.menuItemList.find(
      (cat) => cat.category === category
    );

    if (!categoryObj) {
      categoryObj = { category: category, subCategory: [] };
      existingMenuItem.menuItemList.push(categoryObj);
    }

    await existingMenuItem.save();
    return res
      .status(201)
      .json({ message: "Category added successfully", existingMenuItem });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}


const fetchAllCategories = async (req, res) => {
  try {
    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid: req.body.uid });
    if (!existingMenuItem) {
      return res.status(404).json({ message: "Restaurant not found" , categories : []});
    }

    let categories = existingMenuItem.menuItemList.map((item) => item.category);
    return res.json({ categories: categories , message: "Categories fetched successfully" });
  } catch (error) {   
    res.status(500).json({ error: error.message , categories : [] });
  }
    

}

const deleteCategory = async (req, res) => {
  try {
    const { uid, category } = req.body;

    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid });

    if (!existingMenuItem) {
      return res.status(404).json({ message: "Menu item not found" });
    }

    existingMenuItem.menuItemList = existingMenuItem.menuItemList.filter(
      (cat) => cat.category !== category
    );

    await existingMenuItem.save();
    return res.json({ message: "Category deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};



const addSubCategory = async (req, res) => {
  try {
    const { uid, category, subCategory } = req.body;

    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid });

    if (!existingMenuItem) {
      return res.status(404).json({ message: "Restaurant not found" });
    }

    let categoryObj = existingMenuItem.menuItemList.find(
      (cat) => cat.category === category
    );

    if (!categoryObj) {
      return res.status(404).json({ message: "Category not found" });
    } 

    let subCategoryObj = categoryObj.subCategory.find(
      (subCat) => subCat.subCategoryName === subCategory
    );

    if (!subCategoryObj) {
      subCategoryObj = { subCategoryName: subCategory, menuItems: [] };
      categoryObj.subCategory.push(subCategoryObj);
    } else {
      return res.status(400).json({ message: "Sub-category already exists" });
    } 

    await existingMenuItem.save();
    return res
      .status(201)
      .json({ message: "Sub-category added successfully", subCategoryObj });
  } catch (error) { 
    res.status(500).json({ error: error.message });
  }
}


const fetchAllSubCategories = async (req, res) => {
  try {
    const { uid, category } = req.body;
    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid });
    if (!existingMenuItem) {
      return res.status(404).json({ message: "Restaurant not found" });
    }
    let subCategories = existingMenuItem.menuItemList
      .find((item) => item.category === category)
      .subCategory.map((item) => item.subCategoryName);
    return res.json({ subCategories: subCategories });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}


const deleteSubCategory = async (req, res) => {
  try {
    const { uid, category, subCategory } = req.body;

    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid }); 

    if (!existingMenuItem) {
      return res.status(404).json({ message: "Restaurant not found" });
    }

    let categoryObj = existingMenuItem.menuItemList.find(
      (cat) => cat.category === category
    );
    if (!categoryObj) {
      return res.status(404).json({ message: "Category not found" });
    }
    let subCategoryObj = categoryObj.subCategory.find(
      (subCat) => subCat.subCategoryName === subCategory
    );
    if (!subCategoryObj) {
      return res.status(404).json({ message: "Sub-category not found" });
    }
    categoryObj.subCategory = categoryObj.subCategory.filter(
      (subCat) => subCat.subCategoryName !== subCategory
    );
    await existingMenuItem.save();
    return res.json({ message: "Sub-category deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}









const saveMenuItem = async (req, res) => {
  try {
    const { uid, category, subCategory, menuItem } = req.body;

    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid });

    if (!existingMenuItem) {
      existingMenuItem = new MenuItem({ uid, menuItemList: [] });
    }

    let categoryObj = existingMenuItem.menuItemList.find(
      (cat) => cat.category === category
    );

    if (!categoryObj) {
      categoryObj = { category: category, subCategory: [] };
      existingMenuItem.menuItemList.push(categoryObj);
      // existingMenuItem.markModified('menuItemList');
    }

    let subCategoryObj = categoryObj.subCategory.find(
      (subCat) => subCat.subCategoryName === subCategory
    );

    if (!subCategoryObj) {
      subCategoryObj = { subCategoryName: subCategory, menuItems: [] };

      categoryObj.subCategory.push(subCategoryObj);
      // existingMenuItem.markModified('menuItemList');
    }

    subCategoryObj.menuItems.push(menuItem);
    // console.log("subCategoryObj", subCategoryObj);
    existingMenuItem.markModified("menuItemList");

    await existingMenuItem.save();
    return res
      .status(201)
      .json({ message: "Menu item added successfully", existingMenuItem });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const getMenuItems = async (req, res) => {
  try {
    const { uid, category, subCategory } = req.params;

    let DB = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = DB.model("MenuItem", menuItemSchema);
    let existingMenuItem = await MenuItem.findOne({ uid });

    if (!existingMenuItem) {
      return res.status(404).json({ message: "Menu items not found" });
    }

    // If category and subCategory are provided
    if (category && subCategory) {
      const categoryObj = existingMenuItem.menuItemList.find(
        (cat) => cat.category === category
      );
      if (!categoryObj) {
        return res.status(404).json({ message: "Category not found" });
      }

      const subCategoryObj = categoryObj.subCategory.find(
        (subCat) => subCat.subCategoryName === subCategory
      );
      if (!subCategoryObj) {
        return res.status(404).json({ message: "Subcategory not found" });
      }

      return res.status(200).json({ menuItems: subCategoryObj.menuItems });
    }

    // If only category is provided
    if (category) {
      const categoryObj = existingMenuItem.menuItemList.find(
        (cat) => cat.category === category
      );
      if (!categoryObj) {
        return res.status(404).json({ message: "Category not found" });
      }

      return res.status(200).json({ subCategories: categoryObj.subCategory });
    }

    // If neither category nor subCategory is provided, return the full menuItemList
    res.status(200).json({ menuItems: existingMenuItem.menuItemList });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const updateMenuItem = async (req, res) => {
  try {
    const { uid, category, subCategory, menuitemid } = req.params;
    const { updatedata } = req.body;

    const db = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = db.model("MenuItem", menuItemSchema);
    const existingMenuItem = await MenuItem.findOne({ uid });

    if (!existingMenuItem) {
      return res.status(404).json({ message: "Menu item not found" });
    }

    const categoryObj = existingMenuItem.menuItemList.find(
      (cat) => cat.category === category
    );
    if (!categoryObj) {
      return res.status(404).json({ message: "Category not found" });
    }

    const subCategoryObj = categoryObj.subCategory.find(
      (subCat) => subCat.subCategoryName === subCategory
    );
    if (!subCategoryObj) {
      return res.status(404).json({ message: "SubCategory not found" });
    }

    const menuItem = subCategoryObj.menuItems.find(
      (item) => item._id.toString() === menuitemid
    );
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
};

const deleteMenuItem = async (req, res) => {
  try {
    const { uid, category, subCategory, menuitemid } = req.params;

    const db = mongoose.connection.useDb("NukkadFoods");
    const MenuItem = db.model("MenuItem", menuItemSchema);
    const existingMenuItem = await MenuItem.findOne({ uid });

    if (!existingMenuItem) {
      return res.status(404).json({ message: "Menu item not found" });
    }

    const categoryObj = existingMenuItem.menuItemList.find(
      (cat) => cat.category === category
    );
    if (!categoryObj) {
      return res.status(404).json({ message: "Category not found" });
    }

    const subCategoryObj = categoryObj.subCategory.find(
      (subCat) => subCat.subCategoryName === subCategory
    );
    if (!subCategoryObj) {
      return res.status(404).json({ message: "SubCategory not found" });
    }

    const index = subCategoryObj.menuItems.findIndex(
      (item) => item._id.toString() === menuitemid
    );
    if (index === -1) {
      return res.status(404).json({ message: "Menu item not found" });
    }

    subCategoryObj.menuItems.splice(index, 1);
    await existingMenuItem.save();

    return res.status(200).json({ message: "Menu item deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = { saveMenuItem, getMenuItems, updateMenuItem, deleteMenuItem , addcategory , fetchAllCategories , deleteCategory , addSubCategory , fetchAllSubCategories , deleteSubCategory};
