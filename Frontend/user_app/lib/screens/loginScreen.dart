import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/registerScreen.dart';
import 'package:user_app/Screens/homeScreen.dart';
import 'package:user_app/Widgets/buttons/mainButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/buttons/forgotPasswordButton.dart';
import 'package:user_app/Widgets/buttons/socialLoginButtons.dart';
import 'package:user_app/Widgets/buttons/textRichButton.dart';
import 'package:user_app/Widgets/input_fields/passwordField.dart';
import 'package:user_app/Widgets/input_fields/phoneField.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userNumber = '';
  String userPassword = '';

  void routeHome() {
    if (userNumber != '' && userPassword != '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  void routeRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RegistrationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Text('Sign In', style: h1TextStyle),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: phoneField((String number) {
                  setState(() {
                    userNumber = number;
                  });
                }),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: PasswordField(
                  labelText: 'Password',
                  onValueChanged: (String password) {
                    setState(() {
                      userPassword = password;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: forgotPassButton(userNumber, context),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: mainButton('Sign In', textWhite, routeHome),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: textRichButton(
                    'Don\'t have an account?', 'Sign Up', routeRegister),
              ),
              Center(
                child: Text('Sign in with',
                    style: body4TextStyle.copyWith(color: textGrey2)),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      socialLoginButton('google.png', onGoogleTap),
                      socialLoginButton('facebook.png', onFacebookTap),
                      socialLoginButton('twitter.png', onTwitterTap),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

onGoogleTap() {}

onFacebookTap() {}

onTwitterTap() {}
