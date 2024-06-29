import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Controller/food/food_controller.dart';
import 'package:user_app/Controller/food/menu_model.dart';
import 'package:user_app/screens/Restaurant/cartScreen.dart';
import 'package:user_app/utils/dummy_data.dart';
import 'package:user_app/widgets/buttons/viewCartButton.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/show_snack_bar_extension.dart';
import 'package:user_app/widgets/constants/strings.dart';
import 'package:user_app/widgets/constants/texts.dart';
import 'package:user_app/widgets/customs/Food/searchBar.dart';
import 'package:user_app/widgets/customs/Restaurants/foodItemWidget.dart';
import 'package:user_app/widgets/customs/Restaurants/foodTypeToggle.dart';
import 'package:user_app/widgets/customs/Restaurants/restaurantMenuScroll.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({
    Key? key,
    required this.restaurantID,
  }) : super(key: key);
  final String restaurantID;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<bool> isFilterSelected = [false, false, false, false, false];
  int _cartCounter = 0;
  bool _isFloatingContainerVisible = false;

  // List<bool> isMenuSelected = [false, false, false, false, false, false, false];
  List<bool> isMenuSelected = [];
  int selectedMenuIndex = -1;

  int selectedIndex = 0;

  bool isMenuLoaded = false;
  bool isCategoryLoaded = false;
  FullMenuModel? fullMenu;
  List<String> subCategoryNames = [];
  List<MenuItemModel> menuItemsList = [];
  Map<String, List<MenuItemModel>> menuItemsByCategory = {};
  List<String> categories = [];
  List<String> subCategories = [];
  final Map<String, List<String>> subCategoryMap = {};
  List<MenuItemCategory> menuCategories = [];
  final TextEditingController searchController = TextEditingController();

  void toggleSelection(int index) {
    setState(() {
      isFilterSelected[index] = !isFilterSelected[index];
      filterMenuItem();
    });
  }

  filterMenuItem() {
    List<String> selectedLabels = [];
    menuItemsList = [];
    if (!isMenuSelected.contains(true)) {
      menuItemsByCategory.forEach((key, value) {
        menuItemsList.addAll(value);
      });
      if (isFilterSelected.contains(true)) {
        for (int i = 0; i < isFilterSelected.length; i++) {
          if (isFilterSelected[i] == true) {
            selectedLabels.add(AppStrings.lable[i]);
          }
        }
        // i want that any menu item which lable is in selected label to be added to it
        menuItemsList = menuItemsList.where((element) {
          return selectedLabels.contains(element.label);
        }).toList();
      }
    } else {
      menuItemsList = menuItemsByCategory[
          menuItemsByCategory.keys.toList()[isMenuSelected.indexOf(true)]]!;
      if (isFilterSelected.contains(true)) {
        for (int i = 0; i < isFilterSelected.length; i++) {
          if (isFilterSelected[i] == true) {
            selectedLabels.add(AppStrings.lable[i]);
          }
        }
        // i want that any menu item which lable is in selected label to be added to it
        menuItemsList = menuItemsList.where((element) {
          return selectedLabels.contains(element.label);
        }).toList();
      }
    }
    if (searchController.text.isNotEmpty) {
      menuItemsList = menuItemsList.where((element) {
        return element.menuItemName!.contains(searchController.text);
      }).toList();
    }
    setState(() {});
  }

  onChangedSearch(String text) {
    filterMenuItem();
  }

  void updateCartCounter(int counter) {
    setState(() {
      _cartCounter += counter;
    });
  }

  void handleMenuSelection(int index) {
    setState(() {
      if (selectedMenuIndex == index) {
        isMenuSelected[index] = false;
        selectedMenuIndex = -1;
      } else {
        if (selectedMenuIndex != -1) {
          isMenuSelected[selectedMenuIndex] = false;
        }
        isMenuSelected[index] = true;
        selectedMenuIndex = index;
      }

      filterMenuItem();
    });
  }

  routeCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(counter: _cartCounter),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getMenu();
  }

  Future<void> getMenu() async {
    setState(() {
      subCategoryNames = [];
      menuItemsList = [];
      menuItemsByCategory = {};
      categories = [];
      subCategories = [];
      isMenuLoaded = false;
      isCategoryLoaded = false;
      isMenuSelected = [];
    });

    var result = await FoodController.getMenuItems(
      context: context,
      uid: widget.restaurantID,
    );

    result.fold(
      (String errorMessage) {
        setState(() {
          isMenuLoaded = true;
          isCategoryLoaded = true;
        });
        context.showSnackBar(message: errorMessage);
      },
      (dynamic menuModel) {
        if (menuModel is FullMenuModel) {
          fullMenu = menuModel;
          _processFullMenu();
          categories = fullMenu!.menuItems!
              .map((item) => item.category!)
              .toSet()
              .toList();
          subCategories = fullMenu!.menuItems!
              .expand((item) => item.subCategory!)
              .map((subItem) => subItem.subCategoryName!)
              .toSet()
              .toList();
          isMenuSelected = List.generate(
              fullMenu!.menuItems!
                  .map((item) => item.category!)
                  .toSet()
                  .toList()
                  .length,
              (index) => false);
          menuCategories = List.generate(
              menuItemsByCategory.length,
              (index) => MenuItemCategory(
                  name: menuItemsByCategory.keys.toList()[index],
                  itemCount: menuItemsByCategory[
                          menuItemsByCategory.keys.toList()[index]]!
                      .length));
          menuItemsByCategory.forEach((key, value) {
            menuItemsList.addAll(value);
          });
        } else {
          context.showSnackBar(message: 'Unexpected menu model type');
        }

        setState(() {
          isMenuLoaded = true;
          isCategoryLoaded = true;
        });
      },
    );
  }

  void _processFullMenu() {
    if (fullMenu!.menuItems != null) {
      for (var menuItem in fullMenu!.menuItems!) {
        if (menuItem.category != null && menuItem.subCategory != null) {
          String category = menuItem.category!;
          subCategoryMap[category] = [];
          subCategoryMap[category]!.addAll(menuItem.subCategory!.isEmpty
              ? []
              : menuItem.subCategory!.map((subCategory) =>
                  subCategory.subCategoryName!.isEmpty
                      ? ""
                      : subCategory.subCategoryName!));
          if (!menuItemsByCategory.containsKey(category)) {
            menuItemsByCategory[category] = [];
          }
          menuItemsByCategory[category]!.addAll(menuItem.subCategory!
              .expand((subCategory) => subCategory.menuItems!));
        }
      }
      categories = menuItemsByCategory.keys.toList();
      // getSubAndMenuItemCategoryNames(menuItems: fullMenu!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(),
      body: Stack(
        children: [
          _buildCategoryAndMenuRowWidget(),
          _buildFloatingActionContainer(),
          // Place the Positioned widget for the view cart button outside the SingleChildScrollView
          Positioned(
            bottom: 1.h,
            left: 1.w,
            right: 1.w,
            child: Center(
              child: _cartCounter > 0
                  ? viewCartButton(_cartCounter, routeCart)
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  PreferredSizeWidget _buildAppBarWidget() => AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: Text('Shiva Chinese Wok', style: h4TextStyle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: primaryColor),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          )
        ],
        centerTitle: true,
      );
  Widget _buildFloatingActionButton() => Padding(
        padding:
            EdgeInsets.only(right: 1.w, bottom: _cartCounter > 0 ? 7.h : 1.h),
        child: SizedBox(
          height: 5.h,
          width: 26.w,
          child: FloatingActionButton.extended(
            backgroundColor:
                _isFloatingContainerVisible ? Colors.black : primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              setState(() {
                _isFloatingContainerVisible = !_isFloatingContainerVisible;
              });
            },
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isFloatingContainerVisible
                    ? Icon(
                        Icons.close,
                        color: Colors.white,
                      )
                    : Image.asset('assets/icons/menu_icon.png'),
                SizedBox(width: 2.w),
                Text(
                  _isFloatingContainerVisible ? 'Cancel' : "MENU",
                  style: h6TextStyle.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
  Widget _buildFloatingActionContainer() => _isFloatingContainerVisible
      ? Positioned(
          bottom: 60,
          right: 25.w,
          child: Container(
            width: 250,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: menuCategories.length > 0 && isCategoryLoaded
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int index = 0;
                              index < menuCategories.length;
                              index++)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex =
                                            index; // Update selectedIndex when a menu category is tapped
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${menuCategories[index].name.replaceAll("_", " ")}',
                                          style: TextStyle(
                                            color: index == selectedIndex
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: index == selectedIndex
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          '${menuCategories[index].itemCount}',
                                          style: TextStyle(
                                            color: index == selectedIndex
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: index == selectedIndex
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                        ],
                      )
                    : !isMenuLoaded
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: Text(AppStrings.noCategoriesFound),
                          ),
              ),
            ),
          ),
        )
      : SizedBox.shrink();

  Widget _buildCategoryAndMenuRowWidget() => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: searchBar(
                'Search in Shiva Chinese Wok',
                searchController,
                onChangedSearch,
              ),
            ),
            foodTypeToggle(toggleSelection, isFilterSelected),
            isMenuLoaded && isCategoryLoaded && menuItemsByCategory.isNotEmpty
                ? Container(
                    height: 73.h,
                    margin: EdgeInsets.only(right: 1.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        restaurantMenuScroll(
                            isMenuSelected, handleMenuSelection, categories),
                        Expanded(
                          child: Container(
                              // width: 76.w,
                              color: bgColor,
                              child: menuItemsList.length == 0 &&
                                      categories.length == 0
                                  ? Text(AppStrings.noItemsFound)
                                  : menuItemsList.length == 0
                                      ? Center(
                                          child: Text(AppStrings.noItemsFound),
                                        )
                                      : ListView.builder(
                                          itemCount: menuItemsList.length,
                                          itemBuilder: (context, index) {
                                            return FoodItemWidget(
                                              onCounterChanged:
                                                  updateCartCounter,
                                              menuItem: menuItemsList[index],
                                            );
                                          },
                                        )),
                        ),
                      ],
                    ),
                  )
                : !isMenuLoaded || !isCategoryLoaded
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: Text(
                          AppStrings.noItemsFound,
                        ),
                      ),
          ],
        ),
      );
}
