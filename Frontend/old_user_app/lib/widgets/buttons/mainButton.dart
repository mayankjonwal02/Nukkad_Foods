import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget mainButton(String buttonText, Color buttonTextColor, Function() route) {
  return Center(
    child: SizedBox(
      height: 7.h,
      width: 97.w,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => primaryColor,
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 2.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
        onPressed: route,
        child: Text(
          buttonText.toUpperCase(),
          style: buttonTextStyle.copyWith(
              color: buttonTextColor, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
