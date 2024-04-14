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
              textRichButton(
                  'Don\'t have an account?', 'Sign Up', routeRegister),
              SizedBox(height: 2.h),
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
