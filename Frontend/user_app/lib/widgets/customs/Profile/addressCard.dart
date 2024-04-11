import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget addressCard(icon, String mainText, String address) {
  return Container(
    height: 20.h,
    width: 100.w,
    margin: EdgeInsets.symmetric(vertical: 2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 0.2.h, color: textLightGrey),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Icon(
            icon,
            size: 22.sp,
            color: textBlack,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h4Text(mainText, textBlack),
            SizedBox(
              width: 70.w,
              child: Text(
                address,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: textBlack,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: h5Text('EDIT', primaryColor2),
                ),
                TextButton(
                  onPressed: () {},
                  child: h5Text('DELETE', primaryColor2),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
