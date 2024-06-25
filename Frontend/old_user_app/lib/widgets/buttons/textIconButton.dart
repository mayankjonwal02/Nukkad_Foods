import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget textIconButton(String text, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: body4TextStyle.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 1.w),
        Image.asset(
          'assets/icons/add_icon.png',
          height: 3.h,
        ),
      ],
    ),
  );
}
