import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/font-styles.dart';
import '../widgets/common/custom_text_field.dart';
import '../widgets/common/full_width_green_button.dart';
import '../widgets/common/transition_to_next_screen.dart';
import 'reset_password_success_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _comfirmPasswordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _comfirmPasswordController.dispose();
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
              'Reset Password',
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
            CustomTextField(
              label: 'PASSWORD',
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
              height: 30,
            ),
            CustomTextField(
              label: 'CONFIRM PASSWORD',
              controller: _comfirmPasswordController,
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
              height: 60,
            ),
            FullWidthGreenButton(
                label: 'RESET',
                onPressed: () {
                  Navigator.of(context).push(
                      transitionToNextScreen(ResetPasswordSuccessScreen()));
                })
          ],
        ),
      ),
    );
  }
}
