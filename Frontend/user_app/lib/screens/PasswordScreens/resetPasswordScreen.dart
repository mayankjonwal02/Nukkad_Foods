import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/widgets/input_fields/passwordField.dart';
import '../loginScreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String newPassword = '';
  String confirmPassword = '';

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password', style: h4TextStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 19.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
        child: Column(
          children: [
            PasswordField(
              labelText: 'New Password',
              onValueChanged: (value) {
                setState(() {
                  newPassword = value;
                });
              },
            ),
            SizedBox(height: 2.h),
            PasswordField(
              labelText: 'Confirm Password',
              onValueChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
            ),
            SizedBox(height: 5.h),
            SizedBox(
              height: 7.h,
              width: 97.w,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => primaryColor,
                    ),
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 2.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  child: Text(
                    'Continue'.toUpperCase(),
                    style: h4TextStyle,
                  ),
                  onPressed: () {
                    print(
                        'Password: $newPassword && Confirm Password: $confirmPassword');
                    if (newPassword != confirmPassword) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 4),
                            content: Container(
                              height: 3.h,
                              child: Text(
                                'Entered passwords do not match',
                                style: body4TextStyle,
                              ),
                            ),
                            backgroundColor: colorFailure,
                          ),
                        );
                    } else if (newPassword == '' || confirmPassword == '') {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 4),
                            content: Container(
                              height: 3.h,
                              child: Text('Please enter data',
                                  style: body4TextStyle),
                            ),
                            backgroundColor: colorFailure,
                          ),
                        );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessPage()),
                      );
                    }
                    setState(() {
                      newPassword = '';
                      confirmPassword = '';
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Your Password has been reset!', style: h1TextStyle),
              SizedBox(height: 5.h),
              Center(
                child: Image.asset(
                  'assets/images/passwordSuccess.png',
                  height: 40.h,
                  width: 90.w,
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Redirect to',
                    style: TextStyle(
                      color: textBlack,
                      fontFamily: 'Poppins',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      'Login Page',
                      style: TextStyle(
                        color: primaryColor,
                        fontFamily: 'Poppins',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
