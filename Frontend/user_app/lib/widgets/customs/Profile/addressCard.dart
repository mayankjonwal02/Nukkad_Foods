import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget addressCard(assetName, String mainText, String address) {
  return Container(
    height: 25.h,
    width: 100.w,
    margin: EdgeInsets.symmetric(vertical: 2.h),
    padding: EdgeInsets.symmetric(horizontal: 2.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 0.2.h, color: textGrey3),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 2.w, top: 2.h),
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
            Text(mainText, style: h4TextStyle),
            SizedBox(
              width: 70.w,
              child: Text(
                address,
                style: body4TextStyle,
                maxLines: 4,
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
                  child: Text('EDIT',
                      style: h6TextStyle.copyWith(color: primaryColor)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('DELETE',
                      style: h6TextStyle.copyWith(color: primaryColor)),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
