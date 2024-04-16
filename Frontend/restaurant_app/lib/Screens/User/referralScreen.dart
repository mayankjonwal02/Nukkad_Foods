import 'package:flutter/material.dart';
import 'package:restaurant_app/Screens/User/registerScreen.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/input_fields/textInputField.dart';
import 'package:sizer/sizer.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  int? _selectedOption;

  String executiveId = '';
  String executiveName = '';

  final executiveIdController = TextEditingController();
  final executiveNameController = TextEditingController();

  routeRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 5.w, right: 5.w),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Who recommended nukkad foods to you?'.toUpperCase(),
                style: body3TextStyle,
                maxLines: 2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Column(
              children: [
                buildFriendRadioButton(0, "Nukkad Foods Executive"),
                Padding(
                  padding: EdgeInsets.only(
                      top: 2.h, right: 5.w, left: 5.w, bottom: 2.h),
                  child: textInputField('Executive ID', executiveIdController,
                      (String id) {
                    setState(() {
                      executiveId = id;
                    });
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 2.h, right: 5.w, left: 5.w, bottom: 2.h),
                  child: textInputField(
                      'Executive Name', executiveNameController, (String name) {
                    setState(() {
                      executiveName = name;
                    });
                  }),
                ),
                buildFriendRadioButton(1, "A Friend"),
                buildFriendRadioButton(2, "Self Registration"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 2.h),
            child: mainButton('NEXT', textWhite, () => routeRegistration()),
          ),
        ],
      ),
    );
  }

  Widget buildFriendRadioButton(int value, String title) {
    return RadioListTile<int>(
      value: value,
      groupValue: _selectedOption,
      onChanged: (newValue) {
        setState(() {
          _selectedOption = newValue;
        });
      },
      toggleable: true,
      title: Text(
        title,
        style: body3TextStyle.copyWith(fontWeight: FontWeight.w600),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: primaryColor,
    );
  }
}
