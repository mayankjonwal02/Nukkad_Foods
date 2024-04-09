import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget socialLoginButton(String assetName, Function() onTap) {
  return Material(
    elevation: 2.0,
    borderRadius: BorderRadius.circular(1000),
    child: GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 5.h,
        width: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          'assets/images/socials/$assetName',
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
