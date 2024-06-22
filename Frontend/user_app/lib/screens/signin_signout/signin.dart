import 'package:flutter/material.dart';
import 'package:user_app/screens/forgot_password.dart';
import 'package:user_app/widgets/common/custom_phone_field.dart';
import 'package:user_app/widgets/common/custom_text_field.dart';
import 'package:user_app/widgets/common/full_width_red_button.dart';
import 'package:user_app/widgets/common/transition_to_next_screen.dart';

import '../../utils/colors.dart';
import '../../utils/font-styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: extraLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CustomPhoneField(
                controller: _mobileNumberController,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                label: 'Password',
                isObscured: true,
                icon: Icons.visibility,
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(transitionToNextScreen(ForgotPasswordScreen()));
                },
                child: Center(
                    child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: mediumSmall,
                    color: colorRed,
                  ),
                )),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: FullWidthRedButton(
                  label: 'SIGN IN',
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account?',
                        style: TextStyle(
                            fontSize: mediumSmall, color: Colors.black),
                      ),
                      TextSpan(
                        text: ' Sign up',
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
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                'Sign in with',
                style: TextStyle(color: colorGray, fontSize: mediumSmall),
              )),
              SizedBox(
                height: 40,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
