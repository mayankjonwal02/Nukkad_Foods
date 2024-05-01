import 'package:flutter/material.dart';
import 'package:restaurant_app/Screens/OrderScreens/OrdersScreen.dart';
import 'package:restaurant_app/Screens/UserScreens/getStartedScreen.dart';
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
          builder: (context) => const OrdersScreen(),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign In', style: h1TextStyle),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
                  child: phoneField((String number) {
                    setState(() {
                      userNumber = number;
                    });
                  }),
                ),
                PasswordField(
                  labelText: 'Password',
                  onValueChanged: (String password) {
                    setState(() {
                      userPassword = password;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: forgotPassButton(userNumber, context),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: mainButton('Sign In', textWhite, routeHome),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 6.h, bottom: 2.h),
                    child: Text(
                      'Have not listed with us yet?',
                      style: body4TextStyle.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: mainButton('Register Now!', textWhite, routeRegister),
                ),
                SizedBox(height: 3.h),
                Center(
                  child: Text(
                    'Sign in with',
                    style: body4TextStyle.copyWith(color: textGrey2),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    height: 12.h,
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
      ),
    );
  }
}

onGoogleTap() {}

onFacebookTap() {}

onTwitterTap() {}
