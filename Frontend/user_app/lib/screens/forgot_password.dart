import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:user_app/utils/colors.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/material.dart';
import 'package:user_app/screens/otp_screen.dart';
import 'package:user_app/widgets/common/custom_phone_field.dart';
import 'package:user_app/widgets/common/full_width_red_button.dart';
import 'package:user_app/widgets/common/transition_to_next_screen.dart';

import '../utils/font-styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _mobileNumberController = TextEditingController();

  String generateOTP() {
    Random random = Random();
    int otp = random.nextInt(9000) + 1000; // Generate a 4-digit OTP
    return otp.toString();
  }

  Future<void> sendOTP() async {
    String mobileNumber = _mobileNumberController.text.trim();

    if (mobileNumber.isEmpty || mobileNumber.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Please enter a valid mobile number"),
      ));
      return;
    }

    String otp = generateOTP();
    print("Generated OTP: $otp");

    final String baseUrl = dotenv.env['BASE_URL']!;
    final response = await http.post(
      Uri.parse('$baseUrl/sms/sendSMS'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'to': mobileNumber,
        'body': 'Your OTP for password reset is $otp',
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            isSigninUp: false,
            userNumber: mobileNumber,
            otp: otp,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Failed to send OTP"),
      ));
    }
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
            child: Icon(Icons.arrow_back_ios_new)),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Text(
              'Forgot Password',
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
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              textAlign: TextAlign.center,
              'Verify your phone number xxxxxx999 linked to your account and enter otp to recover your account.',
              style: TextStyle(
                fontSize: mediumSmall,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CustomPhoneField(
              controller: _mobileNumberController,
            ),
            SizedBox(
              height: 80,
            ),
            FullWidthRedButton(
              label: 'SEND OTP',
              // onPressed: () {
              //   Navigator.of(context).push(transitionToNextScreen(OtpScreen()));
              // },
              onPressed: sendOTP,
            )
          ],
        ),
      ),
    );
  }
}
