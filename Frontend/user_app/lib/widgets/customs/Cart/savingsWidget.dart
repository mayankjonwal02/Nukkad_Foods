import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget SavingsWidget() {
  return Container(
    height: 8.h,
    margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h, bottom: 2.h),
    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF76d6fd),
          Color(0xFF8399e9),
          Color(0xFF925bd4),
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/popper_icon.png',
          height: 4.h,
          alignment: Alignment.center,
        ),
        Container(
          width: 75.w,
          margin: EdgeInsets.symmetric(vertical: 0.5.h),
          child: Text(
            'Yay! You’re saving ₹20 on this order',
            style: body4TextStyle.copyWith(
              color: textWhite,
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    ),
  );
}
