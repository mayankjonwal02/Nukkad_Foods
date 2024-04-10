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
        h2Text('Wallet', Colors.white),
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
            child: h4Text('Available Balance'.toUpperCase(), primaryColor2),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/wallet.png'),
            h1Text('47.61', Colors.white),
          ],
        )
      ],
    ),
  );
}
