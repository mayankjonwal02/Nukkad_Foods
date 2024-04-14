import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Restaurant/restaurantScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/ratingWidget.dart';

Widget allRestaurants(BuildContext context) {
  return Container(
    height: 75.h,
    child: ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return restaurant(context);
      },
    ),
  );
}

Widget restaurant(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RestaurantScreen()));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 15.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2.h, color: textGrey3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 15.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/restaurantImage.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 1.h,
                    left: 1.5.w,
                    right: 1.5.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/unlike_heart_icon.svg',
                          height: 3.h,
                        ),
                        ratingWidget(4.1)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5.w),
              SizedBox(
                width: 50.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shiva Chinese Wok',
                      style: h5TextStyle,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      'Saket Nagar, Indore',
                      style: body4TextStyle.copyWith(color: textGrey2),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/timer_icon.svg',
                          height: 3.h,
                          color: primaryColor,
                        ),
                        SizedBox(width: 1.5.w),
                        Text('30 MINS', style: body5TextStyle),
                        SizedBox(width: 1.5.w),
                        Image.asset('assets/icons/dot.png'),
                        SizedBox(width: 1.5.w),
                        Text('5.4 KM', style: body5TextStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 1.w),
                child:
                    GestureDetector(onTap: () {}, child: Icon(Icons.more_vert)),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
