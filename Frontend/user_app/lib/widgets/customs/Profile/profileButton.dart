import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';

Widget button(String text, icon, Null Function() route) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
            color: textBlack,
          ),
        ),
        IconButton(onPressed: route, icon: icon)
      ],
    ),
  );
}
