import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

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
        Text('Copy your code', style: h5TextStyle.copyWith(color: textWhite)),
        Text('58vt3x1', style: h5TextStyle),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.copy_outlined,
            color: textWhite,
            size: 20.sp,
          ),
        ),
      ],
    ),
  );
}
