import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget viewCartButton(counter) {
  return Container(
    height: 7.h,
    padding: EdgeInsets.symmetric(horizontal: 2.w),
    child: Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              counter == 1 ? '${counter} item' : '${counter} items',
              style: h5TextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
              height: double.infinity,
              width: 0.4.w,
              color: Colors.white,
            ),
            Text('₹ 200', style: h5TextStyle),
            const Spacer(),
            Text('View Cart', style: h5TextStyle),
            SizedBox(width: 2.w),
            Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
              size: 20.sp,
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
              size: 25.sp,
            ),
          ],
        ),
      ),
    ),
  );
}
