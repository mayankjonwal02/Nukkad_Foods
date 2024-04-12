import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/widgets/constants/colors.dart';

Widget referalMap() {
  return Container(
    height: 90.h,
    width: 100.w,
    padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 18.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2.h, color: textGrey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/refer_1.png'),
              SizedBox(
                width: 40.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h3Text('1.', primaryColor2),
                    bodyText1(
                        'Share referral link using Whatsapp, SMS, and more.',
                        textBlack),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          height: 18.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2.h, color: textGrey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h3Text('2.', primaryColor2),
                    bodyText1(
                        'Your friend clicks on the link to download the nukkad app or uses your referral code!',
                        textBlack),
                  ],
                ),
              ),
              Image.asset('assets/images/refer_2.png'),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          height: 18.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2.h, color: textGrey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/refer_3.png'),
              SizedBox(
                width: 40.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h3Text('3.', primaryColor2),
                    bodyText1('Friend places their first order.', textBlack),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          height: 25.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2.h, color: textGrey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -15,
                right: 40,
                child: Image.asset('assets/images/refer_4.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h3Text('4.', primaryColor2),
                  SizedBox(
                    width: 75.w,
                    child: bodyText1(
                        'You both earn 50 nukkad coins each, that can be converted to wallet cash and can be used while placing orders. ',
                        textBlack),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
