import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/widgets/constants/colors.dart';

Widget couponButton() {
  return Container(
    height: 8.h,
    width: 80.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: primaryColor2,
      border: Border.all(width: 0.2.h, color: primaryColor2),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        h5Text('Copy your code', Colors.white),
        h5Text('58vt3x1', textBlack),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.copy_outlined,
            color: Colors.white,
            size: 22.sp,
          ),
        ),
      ],
    ),
  );
}
