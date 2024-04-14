import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
  List<bool> isSelected = [false, false, false, false, false];
  int _cartCounter = 0;

  void toggleSelection(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  void updateCartCounter(int counter) {
    setState(() {
      // Increase or decrease the total counter based on the change
      _cartCounter += counter;
    });
  }

  void stateUpdate() {
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    List<bool> isMenuSelected = [false, false, false, false, false];

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
          foodTypeToggle(toggleSelection, isSelected),
          Stack(
            children: [
              Container(
                height: 73.h,
                margin: EdgeInsets.only(right: 1.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    restaurantMenuScroll(isMenuSelected, () {}),
                    SizedBox(
                      width: 76.w,
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
                bottom: 1.5.h,
                left: 0,
                right: 0,
                child: Center(
                  child: _cartCounter > 0
                      ? viewCartButton(_cartCounter)
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
