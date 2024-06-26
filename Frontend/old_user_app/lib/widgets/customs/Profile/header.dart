import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget profileHeader() {
  return SizedBox(
    height: 35.h,
    width: 100.w,
    child: Column(
      children: [
        Text('Profile', style: h2TextStyle),
        SizedBox(height: 2.h),
        Stack(
          children: [
            Image.asset('assets/images/profile_bg.png'),
            Positioned(
              left: 25.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/profile.png'),
                    SizedBox(height: 1.h),
                    Text('Username'.toUpperCase(),
                        style: h4TextStyle.copyWith(color: textWhite))
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
