import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/adsSlider.dart';
import 'package:user_app/Widgets/customs/Food/allRestaurants.dart';
import 'package:user_app/Widgets/customs/Food/appBar.dart';
import 'package:user_app/Widgets/customs/Food/offersSlider.dart';
import 'package:user_app/Widgets/customs/Food/restaurantSlider.dart';
import 'package:user_app/Widgets/customs/Food/searchBar.dart';
import 'package:user_app/Widgets/customs/Food/sectionGrid.dart';
import 'package:user_app/Widgets/customs/Food/sectionSlider.dart';

class FoodBody extends StatefulWidget {
  const FoodBody({super.key});

  @override
  State<FoodBody> createState() => _FoodBodyState();
}

class _FoodBodyState extends State<FoodBody> {
  List restaurantNames = [];
  List restaurantImages = [];
  List foodCategories = [
    'Bowl1',
    'Bowl2',
    'Bowl3',
    'Bowl4',
    'Bowl5',
    'Bowl6',
    'Bowl7',
    'Bowl8'
  ];
  List foodImages = [
    'assets/images/bowl_1.png',
    'assets/images/bowl_2.png',
    'assets/images/bowl_3.png',
    'assets/images/bowl_1.png',
    'assets/images/bowl_2.png',
    'assets/images/bowl_3.png',
    'assets/images/bowl_1.png',
    'assets/images/bowl_2.png',
  ];
  List offerData = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const customAppBar(),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              child: searchBar("What are you looking for?"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              child: adsSlider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Container(
              margin: EdgeInsets.only(left: 2.w),
              child: sectionSlider(
                  'Favorite Merchants', restaurantNames, restaurantImages),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              child: sectionGrid(
                  'Hey, What\'s on your mind?', foodCategories, foodImages),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              child: offersSlider('Offers curated for you', offerData),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.only(bottom: 2.h),
              child: Text(
                'Restaurants near me'.toUpperCase(),
                style: titleTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.only(bottom: 2.h),
              child: Text(
                'Quick Delivery',
                style: h5TextStyle,
              ),
            ),
          ),
          Container(
            height: 30.h,
            padding: EdgeInsets.only(top: 3.h, left: 2.w, bottom: 3.h),
            color: const Color(0xFFfee5ec),
            child: restaurantSlider(context),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.only(top: 3.h,bottom: 2.h),
              child: Text(
                'Nearest Restaurants',
                style: h5TextStyle,
              ),
            ),
          ),
          Container(
            height: 30.h,
            color: const Color(0xFFfee5ec),
            padding: EdgeInsets.only(top: 3.h, left: 2.w, bottom: 3.h),
            child: restaurantSlider(context),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
              child: Text(
                'Latest Restaurants',
                style: h5TextStyle,
              ),
            ),
          ),
          Container(
            height: 30.h,
            padding: EdgeInsets.only(top: 3.h, left: 2.w, bottom: 3.h),
            color: const Color(0xFFfee5ec),
            child: restaurantSlider(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
            child: Divider(
              color: textGrey3,
              thickness: 0.2.h,
              indent: 3.w,
              endIndent: 3.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ALL RESTAURANTS',
                  style: titleTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '50 Restaurants delivering to you',
                  style: body5TextStyle.copyWith(color: textGrey2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            height: 70.h,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return restaurant(context);
              },
            ),
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
