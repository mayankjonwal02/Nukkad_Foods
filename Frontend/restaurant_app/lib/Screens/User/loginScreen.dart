import 'package:flutter/material.dart';
import 'package:restaurant_app/Screens/User/getStartedScreen.dart';
import 'package:restaurant_app/Widgets/buttons/forgotPasswordButton.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/buttons/socialLoginButtons.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/input_fields/passwordField.dart';
import 'package:restaurant_app/Widgets/input_fields/phoneField.dart';
import 'package:sizer/sizer.dart';

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
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  void routeRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GetStartedScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign In', style: h1TextStyle),
              SizedBox(height: 6.h),
              phoneField((String number) {
                setState(() {
                  userNumber = number;
                });
              }),
              SizedBox(height: 2.h),
              PasswordField(
                labelText: 'Password',
                onValueChanged: (String password) {
                  setState(() {
                    userPassword = password;
                  });
                },
              ),
              SizedBox(height: 2.h),
              forgotPassButton(userNumber, context),
              SizedBox(height: 2.h),
              mainButton('Sign In', textWhite, routeHome),
              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
                  child: Text(
                    'Have not listed with us yet?',
                    style: body4TextStyle.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: mainButton('Register Now!', textWhite, routeRegister),
              ),
              SizedBox(height: 3.h),
              Center(
                child: Text('Sign in with',
                    style: body4TextStyle.copyWith(color: textGrey2)),
              ),
              Center(
                child: SizedBox(
                  height: 10.h,
                  width: 50.w,
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
