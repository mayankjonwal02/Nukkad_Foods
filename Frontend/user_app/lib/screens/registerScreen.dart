import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/loginScreen.dart';
import 'package:user_app/Screens/otpScreen.dart';
import 'package:user_app/Widgets/buttons/mainButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/customs/conditionsWidget.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/widgets/buttons/socialLoginButtons.dart';
import 'package:user_app/widgets/input_fields/passwordField.dart';
import 'package:user_app/widgets/input_fields/phoneField.dart';
import 'package:user_app/widgets/input_fields/textInputField.dart';

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

  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
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

  routeSignUp() {
    if (userName != '' &&
        userEmail != '' &&
        userNumber != '' &&
        newPassword != '' &&
        confirmPassword != '' &&
        newPassword == confirmPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(userNumber: userNumber, option: 2),
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
            Text('Sign Up', style: h1TextStyle),
            Padding(
              padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
              child: textInputField(
                  'Name',
                  userNameController,
                  (String name) => {
                        setState(() {
                          userName = name;
                        })
                      }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child:
                  textInputField('Email', userEmailController, (String email) {
                setState(() {
                  userEmail = email;
                });
              }),
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
                onValueChanged: handlePasswordChange,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: PasswordField(
                labelText: 'Confirm Password',
                onValueChanged: handleConfirmPasswordChange,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: mainButton('Sign Up', textWhite, () => routeSignUp()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Already have an account?', style: body4TextStyle),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  child: Text(
                    'Login',
                    style: body4TextStyle.copyWith(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Center(
              child: Text(
                'Sign In with',
                style: body4TextStyle.copyWith(color: textGrey2),
              ),
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
            privacyPolicyLinkAndTermsOfService()
          ],
        ),
      ),
    ));
  }
}

onGoogleTap() {}

onFacebookTap() {}

onTwitterTap() {}
