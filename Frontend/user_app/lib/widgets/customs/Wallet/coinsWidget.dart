import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget coinsWidget() {
  return Container(
    height: 9.h,
    width: 55.w,
    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
    decoration: BoxDecoration(
      color: Color(0xFFfdf0d8),
      borderRadius: BorderRadius.circular(42),
      border: Border.all(
        width: 0.2.h,
        color: primaryColor2,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 4.h,
          width: 4.h,
          child: Image.asset(
            'assets/icons/coin.png',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 2.w),
        h3Text('30 Coins', textBlack),
      ],
    ),
  );
}
