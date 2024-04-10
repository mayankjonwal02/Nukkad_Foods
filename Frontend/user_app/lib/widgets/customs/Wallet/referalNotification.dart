import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';

Widget referalNotification() {
  return Container(
    height: 20.h,
    width: 100.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/referal.png'),
        SizedBox(
          width: 50.w,
          child: Text(
            'Refer a friend  to Nukkad foods and you both earn ₹50 when they place their first order! ',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: textBlack,
            ),
            textAlign: TextAlign.start,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    ),
  );
}
