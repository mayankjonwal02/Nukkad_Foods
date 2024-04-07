import 'package:flutter/material.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

Widget textRichButton(String text1, String text2, Function() route) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      bodyText1(text1, textGrey),
      TextButton(
        onPressed: () => route(),
        style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        child: h6Text(text2, primaryColor2),
      )
    ],
  );
}
