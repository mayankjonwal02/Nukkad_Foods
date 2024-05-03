import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Screens/notificationScreen.dart';
import '../../constants/colors.dart';
import '../../constants/texts.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isNukkadOpen = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 40.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NukkadName',
                  style: h5TextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                Text(
                  '506 B, kanadiya road main road',
                  style: body5TextStyle.copyWith(
                    fontSize: 9.sp,
                    color: textGrey2,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 25.w,
            height: 4.5.h,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isNukkadOpen = !isNukkadOpen;
                });
              },
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: isNukkadOpen ? textGrey2 : colorSuccess,
                  ),
                  child: Text(
                    isNukkadOpen ? 'CLOSE' : 'OPEN',
                    style: h5TextStyle.copyWith(
                      color: textWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.notifications_outlined,
                color: textBlack,
                size: 22.sp,
              ),
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.menu,
              color: textBlack,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
