import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Restaurant/restaurantScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/ratingWidget.dart';

Widget allRestaurants(BuildContext context) {
  return SizedBox(
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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RestaurantScreen()));
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
                    width: 28.w,
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
              Container(
                width: 50.w,
                padding: EdgeInsets.only(left: 2.w, top: 2.h, bottom: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shiva Chinese Wok',
                      style: h5TextStyle.copyWith(fontSize: 14.sp),
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
                        Text('30 MINS', style: body5TextStyle.copyWith(color: textGrey1)),
                        SvgPicture.asset(
                          'assets/icons/dot.svg',
                          height: 2.h,
                          color: textGrey1,
                        ),Text('5.4 KM', style: body5TextStyle.copyWith(color: textGrey1)),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                color: const Color(0xFFB8B8B8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onSelected: (value) {
                  if (value == 'hide') {
                    // Implement your edit action here
                  } else if (value == 'share') {
                    // Implement your delete action here
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'hide',
                    child: SizedBox(
                      width: 40.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.visibility_off_outlined,
                            color: textBlack,
                            size: 15.sp,
                          ),
                          SizedBox(width: 1.5.w),
                          Text('Hide Restaurant', style: body4TextStyle),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'share',
                    child: SizedBox(
                      width: 42.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: textBlack,
                            size: 15.sp,
                          ),
                          SizedBox(width: 1.5.w),
                          Text('Share Restaurant', style: body4TextStyle),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
