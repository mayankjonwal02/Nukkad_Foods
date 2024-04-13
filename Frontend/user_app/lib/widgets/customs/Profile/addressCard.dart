import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget addressCard(assetName, String mainText, String address) {
  return Container(
    height: 20.h,
    width: 100.w,
    margin: EdgeInsets.symmetric(vertical: 2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 0.2.h, color: textGrey3),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: SvgPicture.asset(
              assetName,
              color: textBlack,
              height: 4.h,
              width: 4.h,
            )),
        SizedBox(
          width: 5.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mainText, style: body4TextStyle),
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
                  child: Text('EDIT', style: h5TextStyle),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('DELETE', style: h5TextStyle),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
