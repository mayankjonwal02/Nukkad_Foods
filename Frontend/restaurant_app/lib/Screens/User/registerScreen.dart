import 'dart:convert';
import 'dart:math'; // Add this import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http; // Add this import
import 'package:intl/intl.dart';
import 'package:restaurant_app/Controller/Profile/profile_controller.dart';
import 'package:restaurant_app/Screens/User/map.dart';
import 'package:restaurant_app/Screens/otpScreen.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/customs/User/registrationTimeline.dart';
import 'package:restaurant_app/Widgets/input_fields/phoneField.dart';
import 'package:restaurant_app/Widgets/input_fields/textInputField.dart';
import 'package:restaurant_app/Widgets/noteWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Add this import
import 'package:flutter/foundation.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String nukkadCity = '';
  String nukkadAddress = '';
  String nukkadPincode = '';
  String nukkadLandmark = '';

  final nukkadCityController = TextEditingController();
  final nukkadAddressController = TextEditingController();
  final nukkadPincodeController = TextEditingController();
  final nukkadLandmarkController = TextEditingController();

  String accountNumber = '';
  String ifscCode = '';
  String bankBranchCode = '';

  final accountNumberController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final bankBranchCodeController = TextEditingController();

  String nukkadContact = '';
  String password = '';
  String confirmPassword = '';

  late GoogleMapController mapController;

  final nukkadContactController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  LocalController _getSavedData = LocalController();
  late Map<String, dynamic> userInfo;
  late Position _currentPosition;
  double getLatitude = 0.0;
  double getLongitude = 0.0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserData();
    _getCurrentLocation();
  }

  Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
        getLatitude = _currentPosition.latitude;
        getLongitude = _currentPosition.longitude;
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getUserData() async {
    try {
      Map<String, dynamic>? getData = await _getSavedData.getUserInfo();
      setState(() {
        userInfo = getData!;
        accountNumberController.text = userInfo['bankAccountNo'];
        ifscCodeController.text = userInfo['bankIFSCcode'];
        bankBranchCodeController.text = userInfo['bankBranch'];
        confirmPasswordController.text = userInfo['password'];
        nukkadContactController.text = userInfo['phoneNumber'];
        passwordController.text = userInfo['password'];
        nukkadAddressController.text = userInfo['nukkadAddress'];
        nukkadCityController.text = userInfo['city'];
        nukkadPincodeController.text = userInfo['pincode'];
        nukkadLandmarkController.text = userInfo['landmark'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  String generateOTP() {
    Random random = Random();
    int otp = random.nextInt(10000);
    return otp.toString().padLeft(4, '0');
  }

  Future<void> routeOTP() async {
    if (nukkadCity.isNotEmpty &&
        nukkadAddress.isNotEmpty &&
        nukkadPincode.isNotEmpty &&
        nukkadLandmark.isNotEmpty &&
        accountNumber.isNotEmpty &&
        ifscCode.isNotEmpty &&
        bankBranchCode.isNotEmpty &&
        nukkadContact.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        userInfo['nukkadAddress'] = nukkadAddress;
        userInfo['latitude'] = getLatitude;
        userInfo['longitude'] = getLongitude;
        // userInfo['bankDetails'] = {
        //   'accountNo': accountNumber,
        //   'IFSCcode': ifscCode,
        //   'bankBranch': bankBranchCode
        // };
        userInfo['bankAccountNo'] = accountNumber;
        userInfo['bankIFSCcode'] = ifscCode;
        userInfo['bankBranch'] = bankBranchCode;
        userInfo['phoneNumber'] = nukkadContact;
        userInfo['password'] = password;
        userInfo['pincode'] = nukkadPincode;
        userInfo['city'] = nukkadCity;
        userInfo['landmark'] = nukkadLandmark;
        saveUserInfo(userInfo);

        // Generate OTP
        String otp = generateOTP();
        print(otp);

        // // Call the sendOtp endpoint
        // final String baseUrl = dotenv.env['BASE_URL']!;
        // final response = await http.post(
        //   Uri.parse('$baseUrl/sms/sendSMS'), // Update with your backend URL
        //   headers: <String, String>{
        //     'Content-Type': 'application/json; charset=UTF-8',
        //   },
        //   body: jsonEncode(<String, String>{
        //     'to': nukkadContact,
        //     'body': 'Your OTP is $otp',
        //   }),
        // );

        // debugPrint('response : $response');

        if (true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OTPScreen(
              userNumber: nukkadContact,
              otp: otp,
              option: 2,
            );
          }));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Failed to send OTP"),
          ));
        }
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return OTPScreen(
        //     userNumber: nukkadContact,
        //     option: 2,
        //   );
        // }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: colorFailure,
            content: Text("Your Password does not match")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: colorFailure,
          content: Text("All fields are required")));
    }
  }

  Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Serialize nested objects to JSON strings
    // userInfo['bankDetails'] = jsonEncode(userInfo['bankDetails']);
    // userInfo['fssaiDetails'] = jsonEncode(userInfo['fssaiDetails']);
    // userInfo['gstDetails'] = jsonEncode(userInfo['gstDetails']);
    // userInfo['kycDetails'] = jsonEncode(userInfo['kycDetails']);

    await prefs.setString('user_info', jsonEncode(userInfo));
    print(prefs.getString('user_info'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    'Register with us!',
                    style: h1TextStyle.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const RegistrationTimeline(pageIndex: 0),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
                  child: Text(
                    'Nukkad Information'.toUpperCase(),
                    style: h4TextStyle.copyWith(color: primaryColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: textGrey2, width: 0.2.w)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: textInputField(
                          'City'.toUpperCase(), nukkadCityController,
                          (String input) {
                        setState(() {
                          nukkadCity = input;
                        });
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: textInputField(
                          'Address'.toUpperCase(), nukkadAddressController,
                          (String input) {
                        setState(() {
                          nukkadAddress = input;
                        });
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: TextField(
                        autofocus: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        keyboardType: TextInputType.number,
                        controller: nukkadPincodeController,
                        onChanged: (value) {
                          setState(() {
                            nukkadPincode = value;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                BorderSide(color: textGrey2, width: 0.1.h),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                BorderSide(color: textGrey2, width: 0.1.h),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          labelText: 'PINCODE'.toUpperCase(),
                          labelStyle: body4TextStyle.copyWith(color: textGrey2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: textInputField(
                          'Landmark'.toUpperCase(), nukkadLandmarkController,
                          (String input) {
                        setState(() {
                          nukkadLandmark = input;
                        });
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                      child: noteWidget(
                          'Please enter the same address as in the documentation.'),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Text(
                    'Select your location on map'.toUpperCase(),
                    style: titleTextStyle,
                  ),
                ),
              ),
              Container(
                height: 40.h,
                color: bgColor,
                child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(60.0, 60.0),
                    zoom: 12.0,
                  ),
                  markers: Set.from([]),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Text(
                    'BANK DETAILS'.toUpperCase(),
                    style: titleTextStyle,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: textGrey2, width: 0.2.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                      child: textInputFieldNumber(
                          'Account Number'.toUpperCase(),
                          accountNumberController, (String input) {
                        setState(() {
                          accountNumber = input;
                        });
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: textInputField(
                          'IFSC Code'.toUpperCase(), ifscCodeController,
                          (String input) {
                        setState(() {
                          ifscCode = input;
                        });
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                      child: textInputField('Bank Branch Code'.toUpperCase(),
                          bankBranchCodeController, (String input) {
                        setState(() {
                          bankBranchCode = input;
                        });
                      }),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Text(
                    'Nukkad Contact'.toUpperCase(),
                    style: titleTextStyle,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: textGrey2, width: 0.2.w)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                      child: PhoneField(
                        controller: nukkadContactController,
                        onPhoneNumberChanged: (String number) {
                          setState(() {
                            nukkadContact = number;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Text(
                          'An OTP will be sent to your registered mobile number',
                          style: body6TextStyle.copyWith(color: textGrey2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: textInputField(
                          'Create Password'.toUpperCase(), passwordController,
                          (String input) {
                        setState(() {
                          password = input;
                        });
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                      child: textInputField('Confirm Password'.toUpperCase(),
                          confirmPasswordController, (String input) {
                        setState(() {
                          confirmPassword = input;
                        });
                      }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                child: mainButton('Next', textWhite, routeOTP),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textInputFieldNumber(String labelText,
      TextEditingController controller, Function(String) onInputChanged) {
    controller.addListener(() {
      onInputChanged(controller.text);
    });
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(7),
      child: TextField(
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(18),
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: textGrey2, width: 0.1.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: textGrey2, width: 0.1.h),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          labelText: labelText.toUpperCase(),
          labelStyle: body4TextStyle.copyWith(color: textGrey2),
        ),
        onChanged: (value) {
          onInputChanged(value);
        },
      ),
    );
  }
}
