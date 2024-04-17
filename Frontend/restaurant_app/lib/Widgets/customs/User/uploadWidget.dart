import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:sizer/sizer.dart';

Widget uploadWidget(Function() onTap) {
  return GestureDetector(
    onTap: () => onTap,
    child: Container(
      height: 15.h,
      width: 15.h,
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        color: textGrey2,
        border: Border.all(
          color: textGrey1,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 4.h,
        width: 4.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: textWhite),
        child: SvgPicture.asset(
          'assets/icons/add_icon.svg',
          height: 3.h,
        ),
      ),
    ),
  );
}
