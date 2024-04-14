import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget button(String text, icon, Null Function() route) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: body1TextStyle.copyWith(
              fontWeight: FontWeight.w400, fontSize: 20.sp),
        ),
        IconButton(onPressed: route, icon: icon)
      ],
    ),
  );
}
