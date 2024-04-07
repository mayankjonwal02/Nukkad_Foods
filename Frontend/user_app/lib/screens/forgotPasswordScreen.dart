import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/otpScreen.dart';
import 'package:user_app/widgets/constants/texts.dart';
import 'package:user_app/widgets/input_fields/phoneField.dart';

import '../widgets/constants/colors.dart';
import 'loginScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final String userNumber;
  const ForgotPasswordScreen({Key? key, required this.userNumber})
      : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String enteredNumber = '';

  @override
  Widget build(BuildContext context) {
    String userNumber = widget.userNumber;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 19.sp,
            color: Colors.black,
          ),
        ),
        title: h4Text('Forgot Password', textBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verify your phone number ${'XXXXXXX' + userNumber.substring(userNumber.length - 3)} linked to your account and enter otp to recover your account.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              phoneField((String number) {
                setState(() {
                  enteredNumber = number;
                });
              }),
              SizedBox(height: 8.h),
              Container(
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
                  child: h4Text('Send OTP'.toUpperCase(), Colors.white),
                  onPressed: () {
                    if (userNumber == enteredNumber) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            userNumber: userNumber,
                            route: '/reset',
                          ),
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
                              child: bodyText1(
                                  'Please enter correct mobile number',
                                  Colors.white),
                            ),
                            backgroundColor: colorFailure,
                          ),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
