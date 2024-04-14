import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Profile/savedAddresses.dart';
import 'package:user_app/Screens/Support/helpSupportScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

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
        Padding(
          padding: EdgeInsets.fromLTRB(0, 1.h, 2.w, 1.h),
          child: SvgPicture.asset(
            'assets/icons/location_pin_icon.svg',
            height: 3.h,
            color: primaryColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 45.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: h5TextStyle,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '506 B, kanadiya road main road',
                    style: body5TextStyle,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedAddresses(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/icons/dropdown_icon.svg',
                height: 3.5.h,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _darkMode = !_darkMode;
            });
          },
          child: Container(
            height: 5.h,
            width: 5.h,
            margin: EdgeInsets.fromLTRB(1.w, 0, 0.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: primaryColor, width: 0.2.h),
              color: _darkMode == true ? const Color(0xFF4d4d4d) : Colors.white,
            ),
            child: Center(
              child: SvgPicture.asset(
                _darkMode
                    ? 'assets/icons/dark_mode_icon.svg'
                    : 'assets/icons/light_mode_icon.svg',
                height: 3.h,
                color: _darkMode ? textGrey3 : textGrey2,
              ),
            ),
          ),
        ),
        TextButton(
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            foregroundColor: MaterialStatePropertyAll(primaryColor),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HelpSupportScreen(),
              ),
            );
          },
          child: Text('Help', style: h6TextStyle.copyWith(color: primaryColor)),
        ),
      ],
    );
  }
}
