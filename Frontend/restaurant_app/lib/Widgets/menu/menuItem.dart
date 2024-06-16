import 'package:flutter/material.dart';
import 'package:restaurant_app/Controller/Profile/Menu/menu_model.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/menu/menuItemCard.dart';
import 'package:sizer/sizer.dart';

class MenuItems extends StatefulWidget {
  MenuItems({
    Key? key,
    required this.categories,
    required this.subCategories,
    required this.menuItemsByCategory,
    required this.menuModel,
  }) : super(key: key);
  final List<String> categories;
  final List<String> subCategories;
  final Map<String, List<MenuItemModel>> menuItemsByCategory;
  final FullMenuModel menuModel;

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> with TickerProviderStateMixin {
  late List<bool> isExpanded;

  _MenuItemsState();

  void _toggleExpand(int index) {
    setState(() {
      isExpanded[index] = !isExpanded[index];
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isExpanded = List.generate(widget.categories.length, (index) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _buildCategoryList(index),
          separatorBuilder: (context, index) => SizedBox(
                height: 5.h,
              ),
          itemCount: widget.categories.length),
    );
  }

  Widget _buildCategoryList(int index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _toggleExpand(index),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.categories[index]} (${widget.menuItemsByCategory[widget.categories[index]]!.length})',
                style: h6TextStyle,
              ),
              Icon(
                isExpanded[index]
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                size: 30,
              ),
            ],
          ),
        ),
        SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: AnimationController(
              vsync: this,
              duration: Duration(milliseconds: 300),
            )..forward(),
            curve: Curves.easeInOut,
          ),
          axisAlignment: 0.0,
          child: isExpanded[index] &&
                  widget.menuItemsByCategory[widget.categories[index]] != null
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, itemIndex) => MenuItemCard(
                        menuItemModel: widget.menuItemsByCategory[
                            widget.categories[index]]![itemIndex],
                        categories: widget.categories,
                        subCategories: widget.subCategories,
                        category: widget.categories[index],
                        subCategory: getSubCategory(index),
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 1.h),
                  itemCount: widget
                      .menuItemsByCategory[widget.categories[index]]!.length)
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  String getSubCategory(int index) {
    String subCategory = "null";
    for (MenuCategory menuItem in widget.menuModel.menuItems!) {
      for (SubCategory subCategory in menuItem.subCategory!) {
        for (MenuItemModel item in subCategory.menuItems!) {
          if (item.id == widget.menuItemsByCategory[widget.categories[index]])
            print(subCategory.subCategoryName);
          return subCategory.subCategoryName ?? "null";
        }
      }
    }
    ;
    return subCategory;
  }
}