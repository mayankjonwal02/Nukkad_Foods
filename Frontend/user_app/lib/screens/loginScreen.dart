import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/input_fields/phoneField.dart';
import 'package:user_app/widgets/constants/texts.dart';

import 'forgotPasswordScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userNumber = '';
  String password = '';
  bool _obscured = false;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
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
            h1Text('Sign In', textBlack),
            SizedBox(height: 4.h),
            phoneField((String number) {
              setState(() {
                userNumber = number;
              });
            }),
            SizedBox(height: 4.h),
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(7.0),
              child: Container(
                height: 8.5.h,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(color: Colors.black, width: 0.1.h),
                ),
                child: TextField(
                  obscureText: _obscured,
                  decoration: InputDecoration(
                    label: bodyText1('Password', textBlack),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscured ? Icons.visibility_off : Icons.visibility,
                        color: primaryColor2,
                      ),
                      onPressed: _toggleObscured,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Center(
              child: TextButton(
                onPressed: () {
                  if (userNumber != '') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ForgotPasswordScreen(userNumber: userNumber),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 4),
                          content: Container(
                            height: 3.h,
                            child:
                                bodyText1('Enter Phone Number', Colors.white),
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
            ),
            SizedBox(height: 2.h),
            Center(
              child: Container(
                height: 7.h,
                width: 97.w,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => primaryColor2,
                      ),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 2.0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    child: h4Text('Sign In'.toUpperCase(), Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                bodyText1('Don\'t have an account?', textLightGrey),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: h6Text('Sign Up', primaryColor2))
              ],
            ),
            SizedBox(height: 2.h),
            Center(
              child: bodyText1('Sign In with', textGrey),
            ),
            Center(
              child: SizedBox(
                height: 10.h,
                width: 50.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    socialLoginButton('google.png'),
                    socialLoginButton('facebook.png'),
                    socialLoginButton('twitter.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget socialLoginButton(String assetName) {
  return Material(
    elevation: 2.0,
    borderRadius: BorderRadius.circular(1000),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        height: 5.h,
        width: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          'assets/images/socials/$assetName',
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
