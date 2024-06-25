import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget couponWidget() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: textGrey2,
        width: 0.2.h,
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Coupons',
              style: body4TextStyle.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 3.w),
            SvgPicture.asset(
              'assets/icons/coupon_icon.svg',
              height: 4.h,
            )
          ],
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 6.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                margin: EdgeInsets.symmetric(vertical: 0.5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: textGrey2,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text(
                      'Enter coupon code',
                      style: body4TextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 25.w,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Apply',
                    style: h6TextStyle.copyWith(
                      color: textBlack,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
