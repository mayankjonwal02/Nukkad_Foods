import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/loginScreen.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String userNumber;
  const OTPScreen({Key? key, required this.userNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String userNumber = widget.userNumber;
    String enteredpin = pinController.text;
    const focusedBorderColor = Colors.black;
    const fillColor = Colors.white;
    const borderColor = Colors.grey;

    final defaultPinTheme = PinTheme(
      width: 16.w,
      height: 8.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: textBlack,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

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
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  focusNode: focusNode,
                  // androidSmsAutofillMethod:
                  //     AndroidSmsAutofillMethod.smsUserConsentApi,
                  // listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => SizedBox(width: 5.w),
                  // validator: (value) {
                  //   return value == '2222' ? ;
                  // },
                  hapticFeedbackType: HapticFeedbackType.heavyImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(7),
                      border:
                          Border.all(color: focusedBorderColor, width: 0.2.h),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: borderColor, width: 0.2.h),
                    ),
                  ),
                ),
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
                  child: h4Text('Send OTP'.toUpperCase(), Colors.white),
                  onPressed: () {
                    if (enteredpin == '8888') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OTPScreen(userNumber: userNumber),
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
                                  'Entered OTP is incorrect', Colors.white),
                            ),
                            backgroundColor: colorFailure,
                          ),
                        );
                    }
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
