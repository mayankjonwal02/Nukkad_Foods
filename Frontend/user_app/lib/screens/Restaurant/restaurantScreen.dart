import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Restaurant/cartScreen.dart';
import 'package:user_app/Widgets/buttons/viewCartButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/searchBar.dart';
import 'package:user_app/Widgets/customs/Restaurants/foodItemWidget.dart';
import 'package:user_app/Widgets/customs/Restaurants/foodTypeToggle.dart';
import 'package:user_app/Widgets/customs/Restaurants/restaurantMenuScroll.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<bool> isFilterSelected = [false, false, false, false, false];
  int _cartCounter = 0;

  List<bool> isMenuSelected = [false, false, false, false, false, false, false];
  int selectedMenuIndex = -1;

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

  // Function for unselected text
  Widget unSelectedText(String data) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.normal,
        fontSize: 10.sp,
        color: textGrey2,
      ),
    );
  }

  // Function for selected text
  Widget selectedText(String data) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: primaryColor,
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: searchBar('Search in Shiva Chinese Wok'),
          ),
          foodTypeToggle(toggleSelection, isFilterSelected),
          Stack(
            children: [
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
          )
        ],
      ),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(right: 1.w, bottom: _cartCounter > 0 ? 7.h : 1.h),
        child: SizedBox(
          height: 5.h,
          width: 20.w,
          child: FloatingActionButton.extended(
            backgroundColor: primaryColor,
            foregroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            label: Row(
              children: [
                Image.asset('assets/icons/menu_icon.png'),
                SizedBox(width: 2.w),
                Text(
                  'MENU',
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
