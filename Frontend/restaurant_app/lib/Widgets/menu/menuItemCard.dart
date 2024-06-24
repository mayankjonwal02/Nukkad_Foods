import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_controller.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_model.dart';
import 'package:restaurant_app/Controller/Profile/Menu/update_menu_item_model.dart';
import 'package:restaurant_app/Screens/Navbar/menuBody.dart';
import 'package:restaurant_app/Widgets/constants/navigation_extension.dart';
import 'package:restaurant_app/Widgets/constants/shared_preferences.dart';
import 'package:restaurant_app/Widgets/constants/strings.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/forms/dishesForm.dart';
import 'package:restaurant_app/Widgets/menu/network_image_widget.dart';

class MenuItemCard extends StatefulWidget {
  const MenuItemCard({
    required this.menuItemModel,
    required this.category,
    required this.subCategory,
    required this.categories,
    required this.subCategories,
    required this.subCategoriesMap,
    required this.menuRefreshCallback,
    Key? key,
  });
  final MenuItemModel menuItemModel;
  final List<String> categories;
  final List<String> subCategories;
  final String category;
  final String subCategory;
  final Map<String, List<String>> subCategoriesMap;
  final MenuRefreshCallback menuRefreshCallback;
  @override
  _MenuItemCardState createState() =>
      _MenuItemCardState(menuItemModel: menuItemModel);
}

class _MenuItemCardState extends State<MenuItemCard> {
  bool inStock = true;
  final MenuItemModel menuItemModel;
  late bool isLoading = false;

  _MenuItemCardState({required this.menuItemModel});

  @override
  void initState() {
    super.initState();
    inStock = menuItemModel.inStock!;
  }

  deleteMenuItem() async {
    await MenuControllerClass.deleteMenuItem(
      context: context,
      uid: SharedPrefsUtil().getString(AppStrings.userId) ?? "",
      menuitemid: menuItemModel.id ?? "",
      category: widget.category.replaceAll(" ", "_"),
      subCategory: widget.subCategory.replaceAll(" ", "_"),
    );
    widget.menuRefreshCallback();
  }

  editMenuItem({required bool inStockValue}) async {
    setState(() {
      isLoading = true;
    });
    await MenuControllerClass.updateMenuItem(
      updateMenuItemModel: UpdateMenuItemModel(
        updatedata: menuItemModel.copyWith(
          inStock: inStockValue,
        ),
      ),
      context: context,
      uid: SharedPrefsUtil().getString(AppStrings.userId) ?? "",
      menuitemid: widget.menuItemModel.id!,
      category: widget.category.replaceAll(" ", "_"),
      subCategory: widget.subCategory.replaceAll(" ", "_"),
    ).then((value) {
      if (value) {
        setState(() {
          inStock = inStockValue;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
    // widget.menuRefreshCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       widget.menuItemModel.menuItemName ?? "",
                      //       style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //           color: Color(0xFFFF0000)),
                      //     ),
                      //     SizedBox(height: 8),
                      //     Text(
                      //       "[Serving Qty As ${widget.menuItemModel.servingInfo ?? ""}] ",
                      //       style: TextStyle(color: Colors.grey, fontSize: 12),
                      //     ),
                      //     SizedBox(
                      //       height: 8,
                      //     ),
                      //     Text(
                      //       '₹ ${widget.menuItemModel.menuItemCost}',
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Icon(
                      //   Icons.check_circle,
                      //   color: Colors.green,
                      // ),
                      _buildDishInfoWidget(),
                      Expanded(
                        flex: 2,
                        child: NetworkImageWidget(
                          imageUrl: widget.menuItemModel.menuItemImageURL!,
                        ),
                      )
                      // Image.network(
                      //   widget.menuItemModel.menuItemImageURL ??
                      //       'https://www.cookingcarnival.com/wp-content/uploads/2021/09/Veg-manchow-soup.webp', // Replace with actual image URL
                      //   width: 100,
                      //   height: 100,
                      // ),
                    ],
                  ),

                  SizedBox(height: 8),
                  Divider(),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 25),
                  //   child: Divider(),
                  // ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInStockIcon(),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      _buildDividerWidget(),
                      _buildEditIcon(),
                      _buildDividerWidget(),
                      _buildDeleteIcon(),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildDishInfoWidget() => Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.menuItemModel.menuItemName ?? "",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF0000)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "[Serving Qty As ${widget.menuItemModel.servingInfo ?? ""}] ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '₹ ${widget.menuItemModel.menuItemCost}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  Widget _buildDividerWidget() => Container(
        height: 50, // Adjust the height as needed
        width: 1, // Adjust the width as needed
        color: Color(0xFFD6D6D6),
      );
  Widget _buildInStockIcon() => Expanded(
        flex: 3,
        child: Row(
          children: [
            Switch(
              activeColor: Color(0xFF35BA2A),
              inactiveThumbColor: Color(0xFFFF0000),
              inactiveTrackColor: Color(0xFFFFCCCC),
              value: inStock,
              onChanged: (value) {
                editMenuItem(inStockValue: value);
                // setState(() {
                //   inStock = value;
                // });
              },
            ),
            Expanded(
              child: Text(
                inStock ? 'In stock' : 'Off stock',
                style: TextStyle(
                    color: inStock ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
  Widget _buildEditIcon() => Expanded(
        flex: 2,
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Color(0xFFFF0000),
                ),
                onPressed: () => context.push(
                      DishesForm(
                        categories: widget.categories,
                        subCategories: widget.subCategories,
                        menuItemModel: menuItemModel,
                        selectedCategory: widget.category,
                        selectedSubCategory: widget.subCategory,
                        edit: true,
                        subCategoriesMap: widget.subCategoriesMap,
                        menuRefreshCallback: widget.menuRefreshCallback,
                      ),
                    )),
            Expanded(
              child: Text(
                'Edit',
                style: h6TextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      );
  Widget _buildDeleteIcon() => Expanded(
        flex: 1,
        child: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            //build are you sure dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('This action cannot be undone.'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Delete'),
                      onPressed: () {
                        deleteMenuItem();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      );
}
