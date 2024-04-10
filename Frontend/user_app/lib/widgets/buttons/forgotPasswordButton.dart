import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/PasswordScreens/forgotPasswordScreen.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

Widget forgotPassButton(String userNumber, BuildContext context) {
  return Center(
    child: TextButton(
      onPressed: () {
        if (userNumber != '') {
          print('User number: $userNumber');
          Navigator.of(context).pushReplacement(
            PageTransition(
              child: ForgotPasswordScreen(userNumber: userNumber),
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 200),
            ),
          );
        } else {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                duration: Duration(seconds: 4),
                content: SizedBox(
                  height: 3.h,
                  child: bodyText1('Enter Phone Number', Colors.white),
                ),
                backgroundColor: colorFailure,
              ),
            );
        }
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: bodyText1('Forgot Password ?', primaryColor2),
    ),
  );
}
