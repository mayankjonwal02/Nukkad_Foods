import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/screens/locationSetupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userNumber = '';
  String userPassword = '';
  bool isLoading = false;

  void routeHome() {
    if (userNumber != '' && userPassword != '') {
      userSignIn();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all details'),
          backgroundColor: colorFailure,
        ),
      );
    }
  }

  Future<void> userSignIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      var baseUrl = dotenv.env['BASE_URL'];
      var reqData = {'contact': userNumber, 'password': userPassword};
      String requestBody = jsonEncode(reqData);
      final response = await http.post(Uri.parse('$baseUrl/auth/userLogin'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: requestBody);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData != null && responseData['executed']) {
          saveUserInfo(responseData['uid']);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: colorSuccess,
              content: Text("Login Successfully")));
          setState(() {
            isLoading = false;
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LocationSetupScreen(),
            ),
          );
        } else {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: colorFailure,
                content: Text(responseData['message'])),
          );
        }
      } else {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: colorFailure, content: Text("Failed to login")));
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: colorFailure, content: Text("Error: Server Error")));
    }
  }

  Future<void> saveUserInfo(userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('UserId', userInfo);
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
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: colorFailure,
                      ),
                    )
                  : Padding(
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
                  padding:
                      EdgeInsets.symmetric(vertical: 3.h, horizontal: 15.w),
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
