import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/registerScreen.dart';
import 'package:user_app/widgets/buttons/forgotPasswordButton.dart';
import 'package:user_app/widgets/buttons/mainButton.dart';
import 'package:user_app/widgets/buttons/socialLoginButtons.dart';
import 'package:user_app/widgets/buttons/textRichButton.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/input_fields/passwordField.dart';
import 'package:user_app/widgets/input_fields/phoneField.dart';
import 'package:user_app/widgets/constants/texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userNumber = '';
  String password = '';

  void routeSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void routeRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
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
              h1Text('Sign In', textBlack),
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
                    password = password;
                  });
                },
              ),
              SizedBox(height: 2.h),
              forgotPassButton(userNumber, context),
              SizedBox(height: 2.h),
              mainButton('Sign In', Colors.white, routeSignIn),
              SizedBox(height: 2.h),
              textRichButton(
                  'Don\'t have an account?', 'Sign Up', routeRegister),
              SizedBox(height: 2.h),
              Center(
                child: bodyText1('Sign In with', textGrey),
              ),
              Center(
                child: SizedBox(
                  height: 8.h,
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
      ),
    );
  }
}
