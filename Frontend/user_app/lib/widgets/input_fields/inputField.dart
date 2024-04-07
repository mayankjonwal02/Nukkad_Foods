import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/widgets/constants/colors.dart';

Widget inputField(String labelText, Function(String) onChanged) {
  final controller = TextEditingController();
  controller.addListener(() {
    onChanged(controller.text);
  });
  return Material(
    elevation: 3.0,
    borderRadius: BorderRadius.circular(7),
    child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: textLightGrey, width: 0.1.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: textLightGrey, width: 0.1.h),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          labelText: labelText.toUpperCase(),
          labelStyle: TextStyle(
            color: textGrey,
            fontFamily: 'Poppins',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: (value) {
          onChanged(value);
        }),
  );
}
