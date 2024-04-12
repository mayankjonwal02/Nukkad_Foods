import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  List foodCategories = [];
  List foodImaqes = [];
  List offerData = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(3.w, 5.h, 2.w, 0),
        child: Column(
          children: [
            customAppBar(),
            searchBar("What are you looking for?"),
            adsSlider(),
            SizedBox(height: 1.h),
            sectionSlider(
                'Favorite Merchants', restaurantNames, restaurantImages),
            Divider(color: textGrey, thickness: 0.2.h),
            sectionGrid(
                'Hey, What\'s on your mind?', foodCategories, foodImaqes),
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
            restaurantSlider(context),
            SizedBox(height: 3.h),
            Align(
              alignment: Alignment.centerLeft,
              child: h5Text('Nearest Restaurants', textBlack),
            ),
            SizedBox(height: 1.h),
            restaurantSlider(context),
            SizedBox(height: 3.h),
            Align(
              alignment: Alignment.centerLeft,
              child: h5Text('Latest Restaurants', textBlack),
            ),
            SizedBox(height: 1.h),
            restaurantSlider(context),
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
            SizedBox(
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
      ),
    );
  }
}
