// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Profile/savedAddresses.dart';
import 'package:user_app/Screens/Subscriptions/planScreen.dart';
import 'package:user_app/Screens/Support/helpSupportScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/screens/rewards/rewardsScreen.dart';

class customAppBar extends StatefulWidget {
  const customAppBar({super.key});

  @override
  State<customAppBar> createState() => _customAppBarState();
}

class _customAppBarState extends State<customAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.h, right: 1.8.w, left: 3.w),
      child: Row(
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
                width: 49.w,
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
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlanScreen(),
                  // builder: (context) => const RewardsScreen(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/rewards_icon.svg',
              height: 4.5.h,
              width: 4.5.h,
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
            child:
                Text('Help', style: h6TextStyle.copyWith(color: primaryColor)),
          ),
        ],
      ),
    );
  }
}
