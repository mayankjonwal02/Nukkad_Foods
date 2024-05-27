import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/homeScreen.dart';
import 'package:user_app/widgets/buttons/mainButton.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';
import 'package:user_app/widgets/input_fields/phoneField.dart';
import 'package:user_app/widgets/input_fields/textInputField.dart';

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
  final userNumbercontroller = TextEditingController();
  final userGendercontroller = TextEditingController();
  bool isLoading = false;
  String userId = '';

  void routeHome() {
    if (userNumber != '' && userName != '' && userEmail != '') {
      updatePrifile();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all details'),
          backgroundColor: colorFailure,
        ),
      );
    }
  }

  Future<void> updatePrifile() async {
    setState(() {
      isLoading = true;
    });
    try {
      var baseUrl = dotenv.env['BASE_URL'];
      var reqData = {
        "_id": userId,
        "updateData": {
          "username": userName,
          "contact": userNumber,
          "email": userEmail,
          // "gender": userGender",
          // "userImg":""
          // ...
        }
      };
      String requestBody = jsonEncode(reqData);
      final response =
          await http.post(Uri.parse('$baseUrl/auth/updateUserById/'),
              headers: {
                'Content-Type': 'application/json',
              },
              body: requestBody);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData != null && responseData['executed']) {
          // saveUserInfo(responseData['uid']);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: colorSuccess,
              content: Text("Profile updated Successfully")));
          setState(() {
            isLoading = false;
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: colorFailure,
                content: Text(responseData['message'])),
          );
        }
      } else {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: colorFailure,
            content: Text("Profile updated fail")));
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: colorFailure, content: Text("Error: Server Error")));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  Future<void> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('UserId');
    userId = user_id != null ? user_id : '';
    // print('sdfsdfsdfsfd$user_id $userId');
  }

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
        title: Text('Edit Profile', style: h4TextStyle),
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
                userNumber = number;
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
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: colorFailure,
                    ),
                  )
                : mainButton('update profile', Colors.white, routeHome)
          ],
        ),
      ),
    );
  }
}
