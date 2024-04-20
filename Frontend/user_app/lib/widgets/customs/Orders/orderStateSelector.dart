import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Orders/orderProcessingScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget OrderStateSelector(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        child: Container(
          width: 47.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: primaryColor,
              width: 0.2.h,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/schedule_order_icon.svg',
                height: 3.h,
                color: primaryColor,
              ),
              SizedBox(width: 1.w),
              Text(
                'Schedule Order',
                style:
                    h5TextStyle.copyWith(color: primaryColor, fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderProcessingScreen(),
            ),
          );
        },
        child: Container(
          width: 40.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: primaryColor,
                width: 0.2.h,
              ),
              color: primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Order Now',
                style: h5TextStyle.copyWith(color: textWhite, fontSize: 13.sp),
              ),
              SizedBox(width: 2.w),
              SvgPicture.asset(
                'assets/icons/order_now_icon.svg',
                height: 2.h,
                color: textWhite,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
