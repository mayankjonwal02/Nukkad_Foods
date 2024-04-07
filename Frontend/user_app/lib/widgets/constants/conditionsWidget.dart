import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/widgets/constants/colors.dart';

Widget privacyPolicyLinkAndTermsOfService() {
  final termsOfServiceTap = TapGestureRecognizer()
    ..onTap = () {
      print('Terms of Service tapped');
    };

  final privacyPolicyTap = TapGestureRecognizer()
    ..onTap = () {
      print('Privacy Policy tapped');
    };

  return Center(
    child: Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'By clicking Sign In, I agree to the ',
        style: TextStyle(
          fontSize: 8.sp,
          color: textBlack,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(
              fontSize: 8.sp,
              color: textBlack,
              decoration: TextDecoration.underline,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            recognizer: termsOfServiceTap,
          ),
          TextSpan(
            text: ' and ',
            style: TextStyle(
                fontSize: 8.sp,
                color: textBlack,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              fontSize: 8.sp,
              color: textBlack,
              decoration: TextDecoration.underline,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            recognizer: privacyPolicyTap,
          ),
        ],
      ),
    ),
  );
}
