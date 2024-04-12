import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/customs/Food/ratingWidget.dart';

Widget restaurantSlider() {
  return SizedBox(
    height: 20.h,
    child: ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 20.h,
          width: 30.w,
          margin: EdgeInsets.only(right: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2.h, color: textLightGrey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 13.5.h,
                width: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.asset('assets/images/restaurantImage.png',
                        fit: BoxFit.fill),
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
                            color: Colors.white,
                          ),
                          ratingWidget(2.5),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Divider(
                height: 0.05.h,
                color: textGrey,
                indent: 1.w,
                endIndent: 1.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Text(
                  'Shiva Chinese',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: textBlack),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/timer_icon.svg',
                    color: primaryColor2,
                    height: 3.h,
                  ),
                  Text(
                    '20 Mins',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: textGrey,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Image.asset('assets/icons/dot.png'),
                  Text(
                    '4 KM',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: textGrey,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}
