import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget ratingWidget(double rating) {
  Color bgColor;

  if (rating >= 1.0 && rating < 2.6) {
    bgColor = Colors.red;
  } else if (rating >= 2.6 && rating < 3.8) {
    bgColor = Colors.yellow;
  } else {
    bgColor = Colors.green;
  }

  return Container(
    height: 2.5.h,
    width: 10.5.w,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 11.sp,
        )
      ],
    ),
  );
}
