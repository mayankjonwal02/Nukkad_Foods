import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/forgotPasswordScreen.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

Widget forgotPassButton(String userNumber, BuildContext context) {
  return Center(
    child: TextButton(
      onPressed: () {
        if (userNumber != '') {
          print('User number: $userNumber');
          Navigator.of(context).pushReplacement(
            
            MaterialPageRoute(
              builder: (context) => ForgotPasswordScreen(userNumber: userNumber),
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
