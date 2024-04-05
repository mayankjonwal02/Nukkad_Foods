import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/loginScreen.dart';
import 'package:user_app/screens/resetPasswordScreen.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatefulWidget {
  final String userNumber;
  const OTPScreen({Key? key, required this.userNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String enteredpin = '';

  @override
  Widget build(BuildContext context) {
    String userNumber = widget.userNumber;

    return Scaffold(
      appBar: AppBar(
        title: h4Text('Verification', textBlack),
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
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              h3Text(
                  'Verify with OTP sent to ${'XXXXXXX' + userNumber.substring(userNumber.length - 3)}',
                  textBlack),
              SizedBox(height: 8.h),
              OtpTextField(
                fieldHeight: 8.h,
                fieldWidth: 15.w,
                numberOfFields: 4,
                borderColor: Colors.grey.shade600,
                focusedBorderColor: Colors.black,
                cursorColor: Colors.black,
                borderRadius: BorderRadius.circular(7),
                showFieldAsBox: true,
                clearText: true,
                onSubmit: (String verificationCode) {
                  enteredpin = verificationCode;
                },
              ),
              SizedBox(height: 8.h),
              SizedBox(
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
                  child: h4Text('Continue'.toUpperCase(), Colors.white),
                  onPressed: () {
                    if (enteredpin == '8888') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen()),
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
                                  'Entered OTP is incorrect', Colors.white),
                            ),
                            backgroundColor: colorFailure,
                          ),
                        );
                    }
                    setState(() {
                      enteredpin = '';
                    });
                  },
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  bodyText1("Didn't receive OTP?", textBlack),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: h6Text('Resend', primaryColor2))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
