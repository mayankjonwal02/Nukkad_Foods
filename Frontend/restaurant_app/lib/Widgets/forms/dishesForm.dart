import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_controller.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_model.dart';
import 'package:restaurant_app/Controller/Profile/Menu/save_menu_Item.dart';
import 'package:restaurant_app/Controller/Profile/Menu/update_menu_item_model.dart';
import 'package:restaurant_app/Widgets/buttons/addButton.dart';
import 'package:restaurant_app/Widgets/constants/navigation_extension.dart';
import 'package:restaurant_app/Widgets/constants/shared_preferences.dart';
import 'package:restaurant_app/Widgets/constants/show_snack_bar_extension.dart';
import 'package:restaurant_app/Widgets/constants/strings.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/menu/addImage.dart';
import 'package:restaurant_app/Widgets/menu/categories.dart';
import 'package:restaurant_app/Widgets/menu/customInputField.dart';

class DishesForm extends StatefulWidget {
  const DishesForm({
    super.key,
    required this.categories,
    this.subCategory,
    this.menuItemModel,
    this.edit = false,
    this.selectedCategory,
  });
  final List<String> categories;
  final String? subCategory;
  final MenuItemModel? menuItemModel;
  final bool edit;
  final String? selectedCategory;

  @override
  State<DishesForm> createState() => _DishesFormState();
}

class _DishesFormState extends State<DishesForm> {
  TextEditingController itemName = TextEditingController();
  TextEditingController basePrice = TextEditingController();
  TextEditingController packingCharges = TextEditingController();
  TextEditingController noOfServers = TextEditingController();

  String? selectedCategory;
  String selectedLabel = AppStrings.subCategory[0];
  bool isLoading = false;
  final List<bool> subCategoryCheck = [
    true,
    false,
    false,
    false,
    false,
  ];
  final List<String> subCategoryImage = [
    'assets/images/veg.jpeg',
    'assets/images/nonveg.jpeg',
    'assets/images/vegan.png',
    'assets/images/glutenfree.png',
    'assets/images/dairyfree.png'
  ];

  _DishesFormState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCategories(); // Fetch categories when the form initializes

    widget.edit
        ? {
            print(widget.menuItemModel!.toJson()),
            setState(() {
              itemName.text = widget.menuItemModel!.menuItemName!;
              basePrice.text = widget.menuItemModel!.menuItemCost.toString();
              packingCharges.text =
                  widget.menuItemModel!.timeToPrepare.toString();
              noOfServers.text = widget.menuItemModel!.servingInfo!;
              selectedCategory = widget.selectedCategory;
              selectedLabel = widget.subCategory!;
              print(selectedLabel);
              for (int i = 0; i < subCategoryCheck.length; i++) {
                if (widget.subCategory == AppStrings.subCategory[i]) {
                  subCategoryCheck[i] = true;
                }
              }
            })
          }
        : null;
  }


  Future<void> fetchCategories() async {
    try {
      setState(() {
        isLoading = true;
      });

      final categories = await MenuControllerClass.fetchAllCategories(
        uid: SharedPrefsUtil().getString(AppStrings.userId) ?? "",
        context: context,
      );

      setState(() {
        widget.categories.clear();
        widget.categories.addAll(categories as Iterable<String>);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      context.showSnackBar(message: "Failed to fetch categories: ${e.toString()}");
    }
  }

  Future saveMenu() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (_validateForm()) {
        if (widget.edit) {
          await MenuControllerClass.updateMenuItem(
            updateMenuItemModel: UpdateMenuItemModel(
              updatedata: widget.menuItemModel!.copyWith(
                menuItemName: itemName.text,
                menuItemCost: double.tryParse(basePrice.text) ?? 0.0,
                timeToPrepare: double.tryParse(packingCharges.text) ?? 0.0,
                inStock: true,
                servingInfo: noOfServers.text,
              ),
            ),
            context: context,
            uid: SharedPrefsUtil().getString(AppStrings.userId) ?? "",
            menuitemid: widget.menuItemModel!.id!,
            category: widget.selectedCategory ?? "",
            subCategory: widget.subCategory ?? "null",
          );
        } else {
          await MenuControllerClass.saveMenuItem(
            saveMenuItem: SaveMenuItem(
              uid: SharedPrefsUtil().getString(AppStrings.userId),
              category: selectedCategory!,
              subCategory: selectedLabel,
              menuItem: SaveMenuItemModel(
                menuItemName: itemName.text,
                menuItemCost: double.tryParse(basePrice.text) ?? 0.0,
                timeToPrepare: double.tryParse(packingCharges.text) ?? 0.0,
                inStock: true,
                servingInfo: noOfServers.text,
              ),
            ),
            context: context,
          );
        }
        setState(() {
          isLoading = false;
        });
        // context.pop(); // Close the form after successful submission
        // Notify the menu screen that a new item has been added or updated
        Navigator.pop(context, true);
      } else {
        setState(() {
          isLoading = false;
        });
        context.showSnackBar(message: AppStrings.allFieldsRequired);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      context.showSnackBar(message: 'Failed to add dish: ${e.toString()}');
    }
  }

  bool _validateForm() {
    return itemName.text.isNotEmpty &&
        basePrice.text.isNotEmpty &&
        packingCharges.text.isNotEmpty &&
        noOfServers.text.isNotEmpty &&
        selectedCategory != null;
  }

  changeSubCategoryCheck(int index) {
    setState(() {
      for (int i = 0; i < subCategoryCheck.length; i++) {
        subCategoryCheck[i] = i == index ? true : false;
      }
      selectedLabel = AppStrings.subCategory[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Dishes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < AppStrings.subCategory.length; i++)
                      _buildSubCategoryWidget(index: i),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomInputField(labelText: 'Item Name', controller: itemName),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFCACACA)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Item Price', style: h5TextStyle),
                    SizedBox(height: 20),
                    Text(
                      'Enter the price details of the item',
                      style: TextStyle(color: Color(0xFFCACACA)),
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      labelText: 'Base Price',
                      controller: basePrice,
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                        labelText: 'Packing Charges',
                        controller: packingCharges),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFCACACA)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Serving Information', style: h5TextStyle),
                    SizedBox(height: 20),
                    Text(
                      'Enter the size and quantity of the item',
                      style: TextStyle(color: Color(0xFFCACACA)),
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                        labelText: 'No of Serves', controller: noOfServers),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFCACACA)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category', style: h5TextStyle),
                    SizedBox(height: 20),
                    Text(
                      'Define the category of the item',
                      style: TextStyle(color: Color(0xFFCACACA)),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: DropdownButton<String>(
                              elevation: 3,
                              value: selectedCategory,
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Choose item category'),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = newValue;
                                });
                              },
                              isExpanded: true,
                              underline: Container(),
                              items: widget.categories.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(item),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              AddImage(),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : AddButton(
                      onPressed: saveMenu,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubCategoryWidget({required int index, String? imagePath}) =>
      Row(
        children: [
          Category(
            imagePath: subCategoryImage[index],
            label: AppStrings.subCategory[index],
            isSelected: selectedLabel == AppStrings.subCategory[index],
            onTap: () {
              changeSubCategoryCheck(index);
              // setState(() {
              //   for (int i = 0; i < subCategoryCheck.length; i++) {
              //     subCategoryCheck[i] = i == index ? true : false;
              //   }
              //   print(subCategoryCheck);
              //   selectedLabel = AppStrings.subCategory[index];
              // });
            },
          ),
          SizedBox(width: 10),
        ],
      );
}