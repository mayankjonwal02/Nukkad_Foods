import 'package:flutter/material.dart';
import 'package:restaurant_app/Screens/otpScreen.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/customs/User/registrationTimeline.dart';
import 'package:restaurant_app/Widgets/input_fields/phoneField.dart';
import 'package:restaurant_app/Widgets/input_fields/textInputField.dart';
import 'package:restaurant_app/Widgets/noteWidget.dart';
import 'package:sizer/sizer.dart';

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

  final nukkadContactController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void routeOTP() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return OTPScreen(
        userNumber: nukkadContact,
        option: 2,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  'Register with us!',
                  style: h1TextStyle,
                ),
              ),
            ),
            const RegistrationTimeline(pageIndex: 0),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
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
                    child: textInputField(
                        'PINCODE'.toUpperCase(), nukkadPincodeController,
                        (String input) {
                      setState(() {
                        nukkadPincode = input;
                      });
                    }),
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
                    padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
                    child: noteWidget(
                        'Please enter the same address as in the documentations.'),
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
              // child: GoogleMap(
              //   onMapCreated: _onMapCreated,
              //   initialCameraPosition: const CameraPosition(
              //     target: LatLng(0.0, 0.0),
              //     zoom: 12.0,
              //   ),
              //   markers: Set.from([]),
              // ),
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
                  border: Border.all(color: textGrey2, width: 0.2.w)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: textInputField(
                        'Account Number'.toUpperCase(), accountNumberController,
                        (String input) {
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
                    padding: EdgeInsets.symmetric(vertical: 2.h),
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
                    child: phoneField((String input) {
                      setState(() {
                        nukkadContact = input;
                      });
                    }),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Text(
                        'An otp will be sent to your registered mobile number',
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
                    padding: EdgeInsets.symmetric(vertical: 2.h),
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
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
              child: mainButton('Next', textWhite, routeOTP),
            ),
          ],
        ),
      ),
    );
  }
}
