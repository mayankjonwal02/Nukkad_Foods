import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/widgets/constants/navigation_extension.dart';
import 'package:user_app/widgets/constants/shared_preferences.dart';
import 'package:user_app/widgets/constants/show_snack_bar_extension.dart';
import 'package:user_app/widgets/constants/strings.dart';
import 'package:user_app/screens/main/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalController {
  Future<Map<String, dynamic>?> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoString = prefs.getString('user_info');
    if (userInfoString != null) {
      Map<String, dynamic> userInfo = jsonDecode(userInfoString);
      return userInfo;
      // return jsonDecode(userInfoString) as Map<String, dynamic>;
    } else {
      return null;
    }
  }
}

class SignUpController {
  Future<Map<String, dynamic>> signUp([reqData]) async {
    var baseUrl = dotenv.env['BASE_URL'];
    print('request data $reqData');
    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse('$baseUrl/account/updateUserAPIView/$userId'),
    // );
    // request.fields['email'] = email;
    // request.fields['name'] = name;
    // request.fields['gender'] = gender;
    // request.fields['dath_of_birth'] = formattedDate;

    // var streamedResponse = await request.send();

    // var response = await http.Response.fromStream(streamedResponse);
    final response =
        await http.post(Uri.parse('$baseUrl/auth/signup'), body: reqData);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      // return "Failed to Update profile";

      throw Exception('Failed to signup');
    }
  }
}

class SignInController {
  Future<dynamic> signIn() async {
    var baseUrl = dotenv.env['BASE_URL'];
    final response = await http.get(Uri.parse('$baseUrl/auth/login/'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      // print("My datadddddddddddd: $data");
      return data;
      // return Profile.fromJson(data);
    } else {
      throw Exception('Failed to login');
    }
  }
}

class LoginController {
  static Future<void> login({
    required String phoneNumber,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppStrings.loginEndpoint),
        headers: <String, String>{
          AppStrings.contentType: AppStrings.applicationJson,
        },
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'password': password,
        }),
      );

      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        if (jsonResponse['executed'] == true) {
          await SharedPrefsUtil()
              .setString(AppStrings.userId, jsonResponse['uid'])
              .then((value) {
            context.showSnackBar(message: jsonResponse['message']);
            context.push(HomeScreen());
          });
        } else {
          context.showSnackBar(message: jsonResponse['message']);
        }
      } else {
        context.showSnackBar(
            message: jsonResponse['message'] ?? AppStrings.loginError);
      }
    } catch (e) {
      context.showSnackBar(message: AppStrings.serverError);
    }
  }
}