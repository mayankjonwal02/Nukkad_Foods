import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Restaurant/cartScreen.dart';
import 'package:user_app/Widgets/buttons/viewCartButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/searchBar.dart';
import 'package:user_app/Widgets/customs/Restaurants/foodItemWidget.dart';
import 'package:user_app/Widgets/customs/Restaurants/foodTypeToggle.dart';
import 'package:user_app/Widgets/customs/Restaurants/restaurantMenuScroll.dart';
import 'package:user_app/utils/dummy_data.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<bool> isFilterSelected = [false, false, false, false, false];
  int _cartCounter = 0;
  bool _isFloatingContainerVisible = false;

  List<bool> isMenuSelected = [false, false, false, false, false, false, false];
  int selectedMenuIndex = -1;

  int selectedIndex = 0;

  void toggleSelection(int index) {
    setState(() {
      isFilterSelected[index] = !isFilterSelected[index];
    });
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: searchBar('Search in Shiva Chinese Wok'),
                ),
                foodTypeToggle(toggleSelection, isFilterSelected),
                Container(
                  height: 73.h,
                  margin: EdgeInsets.only(right: 1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      restaurantMenuScroll(isMenuSelected, handleMenuSelection),
                      Container(
                        width: 76.w,
                        color: bgColor,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return FoodItemWidget(
                              onCounterChanged: updateCartCounter,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isFloatingContainerVisible) // Conditionally show the container
            Positioned(
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
                    child: Column(
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
                                        '${menuCategories[index].name}',
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
                    ),
                  ),
                ),
              ),
            ),
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
      floatingActionButton: Padding(
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
      ),
    );
  }
}
