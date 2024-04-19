import 'package:flutter/material.dart';
import 'package:restaurant_app/Screens/UserScreens/referralScreen.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/input_fields/textInputField.dart';
import 'package:restaurant_app/Widgets/noteWidget.dart';
import 'package:sizer/sizer.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  String nukkadName = '';
  final nukkadNameController = TextEditingController();

  routeReferral() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReferralScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Let’s get started!'.toUpperCase(),
                style: body3TextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Your Nukkad',
                style: h3TextStyle,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                    child: Text(
                      'Choose how people will see your stall',
                      style: body4TextStyle.copyWith(color: textGrey1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  child: Image.asset('assets/images/get_started.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: textInputField(
                      'Nukkad Name'.toUpperCase(), nukkadNameController,
                      (String name) {
                    setState(() {
                      nukkadName = name;
                    });
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 5.h),
                  child: noteWidget(
                      'This is the name and picture that customers will see on the app.'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
            child: mainButton('Continue', textWhite, routeReferral),
          ),
        ],
      ),
    );
  }
}
