import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:user_app/widgets/constants/colors.dart';

Widget phoneField(Function(String) onPhoneNumberChanged) {
  TextEditingController controller = TextEditingController();
  controller.addListener(() {
    onPhoneNumberChanged(controller.text);
  });
  return Material(
    elevation: 3.0,
    borderRadius: BorderRadius.circular(7.0),
    child: SizedBox(
      height: 7.5.h,
      child: IntlPhoneField(
        disableLengthCheck: true,
        keyboardType: TextInputType.phone,
        showDropdownIcon: false,
        flagsButtonPadding: EdgeInsets.symmetric(horizontal: 3.w),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
        ),
        decoration: InputDecoration(
          labelText: 'Mobile'.toString().toUpperCase(),
          labelStyle: TextStyle(
            color: textGrey1,
            fontFamily: 'Poppins',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(color: textGrey2, width: 0.1.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(color: textGrey2, width: 0.1.h),
          ),
        ),
        dropdownTextStyle: TextStyle(
          color: textBlack,
          fontFamily: 'Poppins',
          fontSize: 13.sp,
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          onPhoneNumberChanged(phone.completeNumber);
        },
      ),
    ),
  );
}
