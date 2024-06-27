import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:user_app/screens/main/home_screen.dart';
import 'package:user_app/widgets/common/custom_text_field.dart';
import 'package:user_app/widgets/common/full_width_red_button.dart';
import 'package:user_app/widgets/common/transition_to_next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/widgets/constants/colors.dart';

import '../../utils/font-styles.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController _houseNumberController = TextEditingController();
  TextEditingController _apartementController = TextEditingController();
  TextEditingController _colonyController = TextEditingController();
  TextEditingController _howToReachController = TextEditingController();
  TextEditingController _saveAsController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _houseNumberController.dispose();
    _apartementController.dispose();
    _colonyController.dispose();
    _howToReachController.dispose();
    _saveAsController.dispose();
  }

  String? username;
  String? email;
  String? contact;
  String? password;
  String? latitude;
  String? longitude;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      email = prefs.getString('email');
      contact = prefs.getString('contact');
      password = prefs.getString('password');
      // latitude = prefs.getString('latitude');
      // longitude = prefs.getString('longitude');
    });
  }

  Future<void> _saveAddress() async {
    String houseFlatNo = _houseNumberController.text.trim();
    String apartment = _apartementController.text.trim();
    String colony = _colonyController.text.trim();
    String howToReach = _howToReachController.text.trim();
    String saveAs = _saveAsController.text.trim();

    // Save the address details to SharedPreferences
    await _saveUserInfo(
      houseFlatNo: houseFlatNo,
      apartment: apartment,
      colony: colony,
      howToReach: howToReach,
      saveAs: saveAs,
    );

    // Call SIGN UP API
    await _signUp();

    // Navigate to HomeScreen after saving address
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
      (route) => false, // Clear all previous routes
    );
  }

  Future<void> _saveUserInfo({
    required String houseFlatNo,
    required String apartment,
    required String colony,
    required String howToReach,
    required String saveAs,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('houseFlatNo', houseFlatNo);
    await prefs.setString('apartment', apartment);
    await prefs.setString('colony', colony);
    await prefs.setString('howToReach', howToReach);
    await prefs.setString('saveAs', saveAs);
  }

  Future<void> _signUp() async {
    setState(() {
      isLoading = true;
    });

    var baseUrl = dotenv.env['BASE_URL'];
    var reqData = {
      'username': username,
      'email': email,
      'contact': contact,
      'password': password,
      'latitude': 12.12345,
      'longitude': 72.31245,
      'gender' : 'male',
      'userImage' : "image_url.png",
      'houseFlatNo': _houseNumberController.text.trim(),
      'area': _apartementController.text.trim(),
      'colony': _colonyController.text.trim(),
      'hint': _howToReachController.text.trim(),
      'saveAs': _saveAsController.text.trim(),
    };
    String requestBody = jsonEncode(reqData);

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData != null && responseData['executed'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: colorSuccess,
              content: Text("Signup Successfully")));
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: colorFailure,
                content: Text(responseData['message'] ?? "Signup failed")),
          );
        }
      } else {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: colorFailure, content: Text("Failed to signup")));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: colorFailure, content: Text("Error: Server Error")));
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
              width: MediaQuery.of(context).size.width * 0.18,
            ),
            Text(
              'Add Address',
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
              height: 40,
            ),
            CustomTextField(
              label: 'HOUSE FLAT NO.',
              controller: _houseNumberController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'APARTMENT/ROAD/AREA',
              controller: _apartementController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'COLONY (OPTIONAL)',
              controller: _colonyController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'HOW TO REACH',
              controller: _howToReachController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'SAVE AS',
              controller: _saveAsController,
            ),
            SizedBox(
              height: 40,
            ),
            FullWidthRedButton(
                label: 'SAVE ADDRESS',
                onPressed: () {
                  Navigator.of(context)
                      .push(transitionToNextScreen(HomeScreen()));
                })
          ],
        ),
      ),
    );
  }
}
