import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/font-styles.dart';
import '../widgets/common/full_width_green_button.dart';
import '../widgets/common/transition_to_next_screen.dart';
import 'location/location_screen.dart';
import 'reset_password_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.isSigninUp = false});

  final bool isSigninUp;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  @override
  void dispose() {
    // Properly dispose of the controllers
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Text(
              'Verification',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: mediumLarge,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Verify with OTP sent to xxxxxxx999',
              style:
                  TextStyle(fontSize: extraLarge, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60), // Add spacing between the text and OTP fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOTPField(controller1, context),
                _buildOTPField(controller2, context),
                _buildOTPField(controller3, context),
                _buildOTPField(controller4, context),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            FullWidthGreenButton(
                label: 'CONTINUE',
                onPressed: () {
                  Navigator.of(context).push(transitionToNextScreen(
                      widget.isSigninUp
                          ? LocationScreen()
                          : ResetPasswordScreen()));
                }),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: 'Didn’t recieve otp?', // This is a string
                style: TextStyle(
                  color: Colors.black,
                ), // You can set a default style here
                children: <TextSpan>[
                  TextSpan(
                    text: ' Resend',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorRed,
                    ), // Custom style for this span
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField(
      TextEditingController controller, BuildContext context) {
    return Material(
      elevation: 2, // Elevation value for shadow
      shadowColor: Colors.grey[400], // Shadow color
      borderRadius: BorderRadius.circular(7),
      child: Container(
        width: 50, // Adjust width as needed
        color: Colors.white,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
