import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_controller.dart';
import 'package:restaurant_app/Screens/Navbar/menuBody.dart';
import 'package:restaurant_app/Widgets/buttons/addButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/navigation_extension.dart';
import 'package:restaurant_app/Widgets/constants/shared_preferences.dart';
import 'package:restaurant_app/Widgets/constants/show_snack_bar_extension.dart';
import 'package:restaurant_app/Widgets/constants/strings.dart';
import 'package:restaurant_app/Widgets/menu/addImage.dart';
import 'package:restaurant_app/Widgets/menu/customInputField.dart';
import 'package:sizer/sizer.dart';

class CategoriesForm extends StatefulWidget {
  const CategoriesForm({
    super.key,
    required this.categories,
    required this.menuRefreshCallback,
  });

  final List<String> categories;
  final MenuRefreshCallback menuRefreshCallback;
  @override
  State<CategoriesForm> createState() => _CategoriesFormState();
}

class _CategoriesFormState extends State<CategoriesForm> {
  TextEditingController categoryName = TextEditingController();
  String? selectedCategory; // To store the currently selected value

  bool isAddCategoryLoaded = true;
  @override
  void dispose() {
    categoryName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomInputField(
                  labelText: 'Category Name', controller: categoryName),
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
              AddImage(),
              SizedBox(
                height: 20,
              ),
              isAddCategoryLoaded
                  ? AddButton(
                      onPressed: () async {
                        setState(() {
                          isAddCategoryLoaded = false;
                        });
                        if (categoryName.text.isNotEmpty) {
                          if (!widget.categories.contains(
                              categoryName.text.replaceAll(" ", "_"))) {
                            String? uid =
                                SharedPrefsUtil().getString(AppStrings.userId);
                            if (uid != null) {
                              await MenuControllerClass.addCategory(
                                uid: uid,
                                category:
                                    categoryName.text.replaceAll(" ", "_"),
                                context: context,
                              ).then((_) {
                                setState(() {
                                  isAddCategoryLoaded = true;
                                });
                                context.pop();
                                widget.menuRefreshCallback();
                              });
                            } else {
                              setState(() {
                                isAddCategoryLoaded = true;
                              });
                              context.showSnackBar(
                                  message: 'User ID is not available');
                            }
                          } else {
                            setState(() {
                              isAddCategoryLoaded = true;
                            });
                            context.showSnackBar(
                                message: 'Category already exists');
                          }
                        } else {
                          setState(() {
                            isAddCategoryLoaded = true;
                          });
                          context.showSnackBar(
                              message: AppStrings.allFieldsRequired);
                        }
                      },
                    )
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
