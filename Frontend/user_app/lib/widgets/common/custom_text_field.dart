import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.label, this.isObscured = false, this.icon});

  final String label;
  final bool isObscured;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2, // Elevation value for shadow
      shadowColor: Colors.grey[400], // Shadow color
      borderRadius: BorderRadius.circular(7),
      child: Container(
        color: Colors.white,
        child: TextField(
          obscureText: isObscured,
          autocorrect: false,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: colorLightGray),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorLightGray),
              ),
              labelText: label,
              labelStyle: TextStyle(color: colorLightGray),
              suffixIcon: Icon(
                icon,
                color: colorRed,
              )),
        ),
      ),
    );
  }
}
