import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_controller.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_model.dart';
import 'package:restaurant_app/Widgets/constants/shared_preferences.dart';
import 'package:restaurant_app/Widgets/constants/show_snack_bar_extension.dart';
import 'package:restaurant_app/Widgets/constants/strings.dart';
import 'package:restaurant_app/Widgets/customs/MenuBody/menuAppBar.dart';
import 'package:restaurant_app/Widgets/customs/MenuBody/menuItems.dart';
import 'package:restaurant_app/Widgets/customs/MenuBody/menuSearchBar.dart';
import 'package:restaurant_app/Widgets/menu/menuItem.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({super.key});

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  bool isMenuLoaded = false;
  FullMenuModel? fullMenu;
  CategoryMenuModel? categoryMenu;
  SimpleMenuModel? simpleMenu;
  List<MenuItemModel>? filteredMenuItems;
  List<String> subCategoryNames = [];
  List<MenuItemModel> menuItemsList = [];
  Map<String, List<MenuItemModel>> menuItemsByCategory = {};
  List<String> categories = [];

  Future<void> getMenu() async {
    setState(() {
      subCategoryNames = [];
      menuItemsList = [];
      menuItemsByCategory = {};
      categories = [];
    });
    var result = await MenuControllerClass.getMenuItems(
      context: context,
      uid: SharedPrefsUtil().getString(AppStrings.userId)!,
    );

    result.fold(
      (String errorMessage) {
        setState(() {
          isMenuLoaded = true;
        });
        context.showSnackBar(message: errorMessage);
      },
      (dynamic menuModel) {
        if (menuModel is FullMenuModel) {
          fullMenu = menuModel;
          _processFullMenu();
        }

        ///todo handle all of them
        /*else if (menuModel is CategoryMenuModel) {
          categoryMenu = menuModel;
          _processCategoryMenu();
        } else if (menuModel is SimpleMenuModel) {
          simpleMenu = menuModel;
          _processSimpleMenu();
        } */
        else {
          context.showSnackBar(message: 'Unexpected menu model type');
        }

        setState(() {
          isMenuLoaded = true;
        });
      },
    );
  }

  void _processFullMenu() {
    if (fullMenu!.menuItems != null) {
      for (var menuItem in fullMenu!.menuItems!) {
        if (menuItem.category != null && menuItem.subCategory != null) {
          String category = menuItem.category!;
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

  getSubAndMenuItemCategoryNames({required FullMenuModel menuItems}) {
    for (var category
        in menuItems.menuItems!.map((e) => e.category).toList() ?? []) {
      for (var subCategory in category.subCategory ?? []) {
        if (subCategory.subCategoryName != null) {
          subCategoryNames.add(subCategory.subCategoryName!);
        }
        if (subCategory.menuItems != null) {
          menuItemsList.addAll(subCategory.menuItems!);
        }
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            isMenuLoaded = false;
          });
          return getMenu();
        },
        child: ListView(
          children: [
            SafeArea(
              child: buildMenuBody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuBody() => Column(
        children: [
          MenuAppBar(
            categories: categories,
          ),
          MenuSearchBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: !isMenuLoaded
                ? Center(child: CircularProgressIndicator())
                : fullMenu == null
                    ? Center(child: Text(AppStrings.noItemsFound))
                    : MenuItems(
                        categories: categories,
                        menuItemsByCategory: menuItemsByCategory,
                        menuModel: fullMenu!,
                      ),
          ),
        ],
      );
}