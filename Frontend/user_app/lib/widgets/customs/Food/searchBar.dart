import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';

Widget searchBar() {
  return Container(
    height: 7.h,
    margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
    child: TextField(
      decoration: InputDecoration(
        hintText: "What are you looking for?",
        contentPadding: EdgeInsets.symmetric(vertical: 1.h),
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF7E7E7E),
        ),
        prefixIcon: IconButton(
          onPressed: () {
            print('Search button pressed');
          },
          icon: SvgPicture.asset(
            'assets/icons/search_icon.svg',
            color: textGrey,
            height: 3.h,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            print('Microphone button pressed');
          },
          icon: SvgPicture.asset('assets/icons/microphone_icon.svg',
              color: primaryColor2, height: 3.h),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textGrey, width: 0.2.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textGrey, width: 0.2.h),
        ),
      ),
    ),
  );
}
