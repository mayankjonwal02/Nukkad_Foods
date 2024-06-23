import 'package:flutter/material.dart';
import 'package:user_app/screens/signin_signout/signin_screen.dart';
import 'package:user_app/widgets/common/custom_phone_field.dart';
import 'package:user_app/widgets/common/custom_text_field.dart';
import 'package:user_app/widgets/common/full_width_red_button.dart';
import 'package:user_app/widgets/common/transition_to_next_screen.dart';

import '../../utils/colors.dart';
import '../../utils/font-styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: extraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextField(
              label: 'NAME',
              controller: _nameController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'EMAIL',
              controller: _emailController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomPhoneField(controller: _phoneNoController),
            SizedBox(
              height: 5,
            ),
            Text(
              'An otp will be sent to your registered mobile number',
              style: TextStyle(
                fontSize: small,
                color: colorGray,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'Password',
              controller: _passwordController,
              isObscured: _isPasswordObscured,
              icon: IconButton(
                icon: Icon(
                  _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                  color: colorRed,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              isObscured: _isConfirmPasswordObscured,
              icon: IconButton(
                icon: Icon(
                  _isConfirmPasswordObscured
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: colorRed,
                ),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FullWidthRedButton(label: 'SIGN UP', onPressed: () {}),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(transitionToNextScreen(SignInScreen()));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account?',
                        style:
                            TextStyle(fontSize: mediumSmall, color: colorGray),
                      ),
                      TextSpan(
                        text: ' Sign in',
                        style: TextStyle(
                          fontSize: mediumSmall,
                          color: colorRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Sign in with',
                  style: TextStyle(fontSize: mediumSmall, color: colorGray)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/googlelogo.png'),
                SizedBox(
                  width: 10,
                ),
                Image.asset('assets/images/facebooklogo.png'),
                SizedBox(
                  width: 10,
                ),
                Image.asset('assets/images/twitterlogo.png'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By clicking Sign In, I agree to the',
                      style:
                          TextStyle(fontSize: mediumSmall, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' terms of service',
                      style: TextStyle(
                        fontSize: mediumSmall,
                        color: colorRed,
                      ),
                    ),
                    TextSpan(
                      text: ' and',
                      style:
                          TextStyle(fontSize: mediumSmall, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' privacy policy',
                      style: TextStyle(
                        fontSize: mediumSmall,
                        color: colorRed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
