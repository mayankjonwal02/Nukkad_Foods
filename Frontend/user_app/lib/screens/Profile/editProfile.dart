import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/buttons/mainButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/input_fields/phoneField.dart';
import 'package:user_app/Widgets/input_fields/textInputField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String userName = '';
  String userNumber = '';
  String userEmail = '';
  String userGender = '';

  final userNamecontroller = TextEditingController();
  final userEmailcontroller = TextEditingController();
  final userGendercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: h4Text('Edit Profile', textBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 8.h,
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
            SizedBox(height: 5.h),
            textInputField(
              'Name',
              userNamecontroller,
              (String name) {
                userName = name;
                print(userName);
              },
            ),
            SizedBox(height: 3.h),
            phoneField(
              (number) {
                print(number);
              },
            ),
            SizedBox(height: 3.h),
            textInputField(
              'Email',
              userEmailcontroller,
              (String email) {
                userEmail = email;
                print(userEmail);
              },
            ),
            SizedBox(height: 3.h),
            textInputField(
              'Gender',
              userGendercontroller,
              (String gender) {
                userGender = gender;
                print(userGender);
              },
            ),
            SizedBox(height: 5.h),
            mainButton('update profile', Colors.white, () => null)
          ],
        ),
      ),
    );
  }
}
