import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_controller.dart';
import 'package:restaurant_app/Controller/Profile/Menu/save_menu_Item.dart';
import 'package:restaurant_app/Widgets/buttons/addButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/navigation_extension.dart';
import 'package:restaurant_app/Widgets/constants/shared_preferences.dart';
import 'package:restaurant_app/Widgets/constants/show_snack_bar_extension.dart';
import 'package:restaurant_app/Widgets/constants/strings.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/menu/customInputField.dart';
import 'package:sizer/sizer.dart';

class SubCategoriesForm extends StatefulWidget {
  const SubCategoriesForm({
    super.key,
  });
  // final List<String> categories;

  @override
  State<SubCategoriesForm> createState() => _SubCategoriesFormState();
}

class _SubCategoriesFormState extends State<SubCategoriesForm> {
  TextEditingController subCategoryName = TextEditingController();
  String? selectedCategory; // To store the currently selected value
  List<String> categories = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    setState(() {
      isLoading = true;
    });
    final result = await MenuControllerClass.fetchAllCategories(
      uid: SharedPrefsUtil().getString(AppStrings.userId) ?? '',
      context: context,
    );
    result.fold((errorMessage) {
      setState(() {
        isLoading = false;
      });
      context.showSnackBar(message: errorMessage);
    }, (fetchedCategories) {
      setState(() {
        categories = fetchedCategories;
        isLoading = false;
      });
    });
  }

  Future<void> addSubCategory() async {
    setState(() {
      isLoading = true;
    });
    if (subCategoryName.text.isNotEmpty && selectedCategory != null) {
      final result = await MenuControllerClass.addSubCategory(
        uid: SharedPrefsUtil().getString(AppStrings.userId) ?? '',
        category: selectedCategory!,
        subCategory: subCategoryName.text,
        context: context,
      );
      result.fold((errorMessage) {
        setState(() {
          isLoading = false;
        });
        context.showSnackBar(message: errorMessage);
      }, (successMessage) {
        setState(() {
          isLoading = false;
        });
        context.showSnackBar(message: successMessage);
        context.pop();
      });
    } else {
      setState(() {
        isLoading = false;
      });
      context.showSnackBar(message: AppStrings.allFieldsRequired);
    }
  }

  Future addMenu() async {
    setState(() {
      isLoading = true;
    });
    if (subCategoryName.text.isNotEmpty && selectedCategory != null) {
      await MenuControllerClass.saveMenuItem(
              saveMenuItem: SaveMenuItem(
                  uid: SharedPrefsUtil().getString(AppStrings.userId),
                  category: selectedCategory,
                  subCategory: subCategoryName.text),
              context: context)
          .then((value) {
        setState(() {
          isLoading = false;
        });
        context.pop();
      }).catchError((error) {
        setState(() {
          isLoading = false;
        });
        context.showSnackBar(
          message: error.toString(),
        );
      });
    } else {
      setState(() {
        isLoading = false;
      });
      context.showSnackBar(
        message: AppStrings.allFieldsRequired,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sub-category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomInputField(
                  labelText: 'Sub-Category Name', controller: subCategoryName),
              SizedBox(
                height: 20,
              ),
              Material(
                elevation: 1.0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: textGrey2, width: 0.1.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Item',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Icon(Icons.add),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFCACACA))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: h5TextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Define the category of the item',
                      style: TextStyle(color: Color(0xFFCACACA)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Choose your border color
                                width: 1.0, // Choose your border width
                              ),
                              borderRadius: BorderRadius.circular(
                                  8.0), // Optional: for rounded corners
                            ),
                            child: DropdownButton<String>(
                              elevation: 3,
                              value: selectedCategory,
                              hint: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Choose item category'),
                              ),
                              isExpanded:
                                  true, // Ensure the dropdown button fills the full width
                              underline:
                                  Container(), // Remove the default underline
                              items: categories.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(item),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : AddButton(
                      onPressed: () {
                        // addMenu();
                        addSubCategory();
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
