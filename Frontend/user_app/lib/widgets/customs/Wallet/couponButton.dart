import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';

Widget couponButton() {
  return Container(
    height: 8.h,
    width: 80.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: primaryColor,
      border: Border.all(width: 0.2.h, color: primaryColor),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Copy your code', style: TextStyle(color: textWhite)),
        const Text('58vt3x1', style: TextStyle(color: textBlack)),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.copy_outlined,
            color: textWhite,
            size: 22.sp,
          ),
        ),
      ],
    ),
  );
}
