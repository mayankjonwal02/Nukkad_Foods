import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

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
        child: Text(buttonText.toUpperCase(), style: h4TextStyle),
        onPressed: () => route(),
      ),
    ),
  );
}
