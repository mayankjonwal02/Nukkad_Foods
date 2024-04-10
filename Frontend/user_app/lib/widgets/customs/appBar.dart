import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/widgets/constants/colors.dart';

class customAppBar extends StatefulWidget {
  const customAppBar({super.key});

  @override
  State<customAppBar> createState() => _customAppBarState();
}

class _customAppBarState extends State<customAppBar> {
  bool _darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('assets/icons/location_pin.png'),
        ),
        Container(
          width: 40.w,
        ),
        Container(
          height: 5.h,
          width: 9.h,
          margin: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: primaryColor2, width: 0.2.h),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/coin.png'),
              h5Text('25', textBlack),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _darkMode = !_darkMode;
            });
            print('Dark mode: $_darkMode');
          },
          child: Container(
            height: 5.h,
            width: 5.h,
            margin: EdgeInsets.fromLTRB(1.w, 0, 0.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: primaryColor2, width: 0.2.h),
              color: _darkMode == true ? const Color(0xFF4d4d4d) : Colors.white,
            ),
            child: Center(
              child: Image.asset('assets/icons/dark_mode.png'),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: h6Text('Help', primaryColor2),
        ),
      ],
    );
  }
}
