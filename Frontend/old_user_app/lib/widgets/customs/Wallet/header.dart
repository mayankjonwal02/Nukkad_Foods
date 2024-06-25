import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget walletHeader() {
  return Container(
    height: 35.h,
    width: 100.w,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFcb120e), Color(0xFFae0e0a), Color(0xFF910a07)],
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(38),
        bottomRight: Radius.circular(38),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 7.h),
        Text('Wallet', style: h2TextStyle.copyWith(color: textWhite)),
        SizedBox(height: 4.h),
        Container(
          height: 5.h,
          width: 100.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Available Balance'.toUpperCase(),
              style: body3TextStyle.copyWith(
                  color: primaryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/wallet.png'),
            Text(
              '47.61',
              style: h1TextStyle.copyWith(color: textWhite),
            ),
          ],
        )
      ],
    ),
  );
}
