import 'package:flutter/material.dart';
import 'package:user_app/widgets/common/custom_phone_field.dart';
import 'package:user_app/widgets/common/full_width_red_button.dart';

import '../utils/font-styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
