import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/customs/adsSlider.dart';
import 'package:user_app/Widgets/customs/appBar.dart';
import 'package:user_app/Widgets/customs/offersSlider.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          offersSlider('Offers curated for you', offerData)
        ],
      ),
    );
  }
}
