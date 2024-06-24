import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class FullWidthGreenButton extends StatelessWidget {
  const FullWidthGreenButton(
      {super.key, required this.label, required this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBrightGreen, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }
}
