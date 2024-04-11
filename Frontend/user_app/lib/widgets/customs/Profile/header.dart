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
        h2Text('Profile', textBlack),
        SizedBox(height: 2.h),
        Stack(
          children: [
            Image.asset('assets/images/profile_bg.png'),
            Positioned(
              top: 10,
              left: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/profile.png'),
                  h3Text('Username'.toUpperCase(), Colors.white)
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
