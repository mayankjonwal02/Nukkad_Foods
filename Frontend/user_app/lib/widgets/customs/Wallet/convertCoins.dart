import 'package:flutter/material.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget convertTextButton() {
  return TextButton(
    style: ButtonStyle(
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      foregroundColor: MaterialStatePropertyAll(Colors.green),
    ),
    onPressed: () {},
    child: h5Text('Convert Coins to wallet money', Colors.green),
  );
}
