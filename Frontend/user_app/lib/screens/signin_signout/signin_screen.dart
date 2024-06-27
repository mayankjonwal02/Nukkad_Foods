import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:user_app/screens/forgot_password.dart';
import 'package:user_app/screens/signin_signout/signup_screen.dart';
import 'package:user_app/widgets/common/custom_phone_field.dart';
import 'package:user_app/widgets/common/custom_text_field.dart';
import 'package:user_app/widgets/common/full_width_red_button.dart';
import 'package:user_app/widgets/common/transition_to_next_screen.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/screens/main/home_screen.dart';
import 'package:sizer/sizer.dart';


import '../../utils/colors.dart';
import '../../utils/font-styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isPasswordObscured = true;

  String userNumber = '';
  String userPassword = '';
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void routeHome() {
    if (userNumber != '' && userPassword != '') {
      // userNumber = userNumber.substring(3);
      if (userNumber.substring(3).length == 10) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomeScreen()),
        // );
        // ViewTotalBillWidget
        // signIn();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: colorFailure,
            content: Text("Please Enter Phone Number Correctly")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: colorFailure,
            content: Text("Please Fill Both Field")),
      );
    }
  }

  Future<void> signIn() async {
    String userNumber = _mobileNumberController.text;
    String userPassword = _passwordController.text;

    if (userNumber.isEmpty || userPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: colorFailure,
          content: Text("Please fill in both fields"),
        ),
      );
      return;
    }

    if (userNumber.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: colorFailure,
          content: Text("Please enter a valid phone number"),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var baseUrl = dotenv.env['BASE_URL'];
      var reqData = {'phoneNumber': userNumber, 'password': userPassword};
      String requestBody = jsonEncode(reqData);

      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData != null && responseData['executed'] == true) {
          saveUserInfo(responseData['uid']);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: colorSuccess,
              content: Text("Login Successful"),
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colorFailure,
              content: Text(responseData['message'] ?? "Login failed"),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: colorFailure,
            content: Text("Failed to login"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: colorFailure,
          content: Text("Error: Server Error"),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveUserInfo(String userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('User_id', userInfo);
    print(prefs.getString('User_id'));
  }

  // void routeRegister() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const GetStartedScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SingleChildScrollView(
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
                  label: 'PASSWORD',
                  controller: _passwordController,
                  isObscured: _isPasswordObscured,
                  icon: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: colorRed,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
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
                    onPressed: signIn,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(transitionToNextScreen(SignupScreen()));
                    },
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
      ),
    );
  }
}
