import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        SvgPicture.asset('assets/icons/coin_icon.svg', height: 4.h),
        SizedBox(width: 2.w),
        h3Text('30 Coins', textBlack),
      ],
    ),
  );
}
