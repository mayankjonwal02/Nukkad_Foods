import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/searchBar.dart';
import 'package:user_app/Widgets/customs/Restaurants/foodItemWidget.dart';
import 'package:user_app/Widgets/customs/Restaurants/foodTypeToggle.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<bool> isSelected = [false, false, false, false, false];
  void toggleSelection(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> isMenuSelected = [false, false, false, false, false];

    unSelectedText(data) {
      return Text(
        data,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          fontSize: 10.sp,
          color: textGrey,
        ),
      );
    }

    selectedText(data) {
      return Text(
        data,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: primaryColor2,
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: h4Text('Shiva Chinese Wok', textBlack),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: primaryColor2),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined))
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
          Container(
            height: 73.h,
            margin: EdgeInsets.only(right: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 22.w,
                  // padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 14.h,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMenuSelected[0] = !isMenuSelected[0];
                                });
                              },
                              child: Container(
                                height: 6.h,
                                width: 20.w,
                                margin: EdgeInsets.symmetric(vertical: 1.h),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: const Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: primaryColor2),
                              ),
                            ),
                            isMenuSelected[0]
                                ? selectedText('Main Course')
                                : unSelectedText('Main Course'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 75.w,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return FoodItemWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
