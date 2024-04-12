import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/ratingWidget.dart';

Widget allRestaurants() {
  return Container(
    height: 75.h,
    child: ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return restaurant();
      },
    ),
  );
}

Widget restaurant() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 1.h),
    child: Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Container(
            height: 15.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.2.h, color: textLightGrey),
            ),
            child: Row(
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
                      bottom: 5,
                      left: 5,
                      right: 5,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h5Text('Shiva Chinese Wok', textBlack),
                    bodyText1('Saket Nagar, Indore', textLightGrey),
                    SizedBox(height: 0.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/timer_icon.svg',
                          height: 3.h,
                          color: primaryColor2,
                        ),
                        SizedBox(width: 1.w),
                        bodyText2('30 MINS', textGrey),
                        SizedBox(width: 1.w),
                        Image.asset('assets/icons/dot.png'),
                        SizedBox(width: 1.w),
                        bodyText2('5.4 KM', textGrey)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    ),
  );
}
