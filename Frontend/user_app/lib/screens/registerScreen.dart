import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/otpScreen.dart';
import 'package:user_app/widgets/constants/conditionsWidget.dart';
import 'package:user_app/widgets/input_fields/inputField.dart';
import 'package:user_app/widgets/input_fields/passwordField.dart';

import '../widgets/constants/colors.dart';
import '../widgets/constants/texts.dart';
import '../widgets/input_fields/phoneField.dart';
import '../widgets/buttons/socialLoginButtons.dart';
import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String userName = '';
  String userEmail = '';
  String userNumber = '';
  String newPassword = '';
  String confirmPassword = '';

  bool obscureText = true;

  void handlePasswordChange(String password) {
    setState(() {
      newPassword = password;
    });
    print('Password changed: $password');
  }

  void handleConfirmPasswordChange(String password) {
    setState(() {
      confirmPassword = password;
    });
    print('Password changed: $confirmPassword');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h1Text('Sign Up', textBlack),
            SizedBox(height: 3.h),
            inputField(
                'Name',
                (String name) => {
                      setState(() {
                        userName = name;
                      })
                    }),
            SizedBox(height: 2.h),
            inputField('Email', (String email) {
              setState(() {
                userEmail = email;
              });
            }),
            SizedBox(height: 2.h),
            phoneField((String number) {
              setState(() {
                userNumber = number;
              });
            }),
            SizedBox(height: 2.h),
            PasswordField(
              labelText: 'Password',
              onValueChanged: handlePasswordChange,
            ),
            SizedBox(height: 2.h),
            PasswordField(
              labelText: 'Confirm Password',
              onValueChanged: handleConfirmPasswordChange,
            ),
            SizedBox(height: 2.h),
            Center(
              child: SizedBox(
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
                    child: h4Text('Sign Up'.toUpperCase(), Colors.white),
                    onPressed: () {
                      print(
                          'All fields are filled \n User name: ${userName} \n Email: ${userEmail} \n Number: ${userNumber} \n Password: ${newPassword} \n Confirm Password: ${confirmPassword}');

                      if (userName != '' &&
                          userEmail != '' &&
                          userNumber != '' &&
                          newPassword != '' &&
                          confirmPassword != '' &&
                          newPassword == confirmPassword) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(
                              userNumber: userNumber,
                              route: '/locationScreen',
                            ),
                          ),
                        );
                        setState(() {
                          userName = '';
                          userEmail = '';
                          userNumber = '';
                          newPassword = '';
                          confirmPassword = '';
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter all details'),
                            backgroundColor: colorFailure,
                          ),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                bodyText1('Already have an account?', textLightGrey),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    child: h6Text('Login', primaryColor2))
              ],
            ),
            SizedBox(height: 1.h),
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
            privacyPolicyLinkAndTermsOfService()
          ],
        ),
      ),
    ));
  }
}
