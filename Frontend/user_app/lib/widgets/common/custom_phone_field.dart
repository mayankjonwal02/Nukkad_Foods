import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2, // Elevation value for shadow
      shadowColor: Colors.grey[400], // Shadow color
      borderRadius: BorderRadius.circular(7),
      child: Container(
        color: Colors.white,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
          ],
          autocorrect: false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: colorLightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: colorLightGray),
            ),
            labelText: 'Mobile',
            labelStyle: TextStyle(color: colorLightGray),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/images/indiaflag.png', // Replace with your flag image asset path
                  width: 30, // Adjust width as needed
                  height: 30, // Adjust height as needed
                ),
                SizedBox(width: 8), // Adjust spacing between image and text
                Text(
                  '+91',
                  style: TextStyle(
                      color: Colors.black87), // Adjust text color as needed
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
