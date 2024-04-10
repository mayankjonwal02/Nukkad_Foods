import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/adsSlider.dart';
import 'package:user_app/Widgets/customs/allRestaurants.dart';
import 'package:user_app/Widgets/customs/appBar.dart';
import 'package:user_app/Widgets/customs/offersSlider.dart';
import 'package:user_app/Widgets/customs/restaurantSlider.dart';
import 'package:user_app/Widgets/customs/searchBar.dart';
import 'package:user_app/Widgets/customs/sectionGrid.dart';
import 'package:user_app/Widgets/customs/sectionSlider.dart';

class FoodBody extends StatefulWidget {
  const FoodBody({super.key});

  @override
  State<FoodBody> createState() => _FoodBodyState();
}

class _FoodBodyState extends State<FoodBody> {
  List restaurantNames = [];
  List restaurantImages = [];
  List foodCategories = [];
  List foodImaqes = [];
  List offerData = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customAppBar(),
          searchBar(),
          adsSlider(),
          SizedBox(height: 1.h),
          sectionSlider(
              'Favorite Merchants', restaurantNames, restaurantImages),
          Divider(color: textGrey, thickness: 0.2.h),
          sectionGrid('Hey, What\'s on your mind?', foodCategories, foodImaqes),
          Divider(color: textGrey, thickness: 0.2.h),
          offersSlider('Offers curated for you', offerData),
          SizedBox(height: 1.h),
          Align(
            alignment: Alignment.centerLeft,
            child: h5Text('Restaurants near me'.toUpperCase(), textBlack),
          ),
          SizedBox(height: 2.h),
          Align(
            alignment: Alignment.centerLeft,
            child: h5Text('Quick Delivery', textBlack),
          ),
          SizedBox(height: 1.h),
          restaurantSlider(),
          SizedBox(height: 3.h),
          Align(
            alignment: Alignment.centerLeft,
            child: h5Text('Nearest Restaurants', textBlack),
          ),
          SizedBox(height: 1.h),
          restaurantSlider(),
          SizedBox(height: 3.h),
          Align(
            alignment: Alignment.centerLeft,
            child: h5Text('Latest Restaurants', textBlack),
          ),
          SizedBox(height: 1.h),
          restaurantSlider(),
          SizedBox(height: 2.h),
          Divider(color: textGrey, thickness: 0.2.h),
          SizedBox(height: 3.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ALL RESTAURANTS',
                style: TextStyle(
                  color: textBlack,
                  fontFamily: 'Poppins',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '50 Restaurants delivering to you',
                style: TextStyle(
                  color: textGrey,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 3.h),
          allRestaurants(),
          SizedBox(height: 2.h),
          allRestaurants(),
          SizedBox(height: 2.h),
          allRestaurants(),
          SizedBox(height: 2.h),
          allRestaurants(),
          SizedBox(height: 2.h),
          allRestaurants(),
          SizedBox(height: 2.h),
          allRestaurants(),
          SizedBox(height: 2.h),
          allRestaurants(),
          SizedBox(height: 2.h),
          allRestaurants(),
        ],
      ),
    );
  }
}
