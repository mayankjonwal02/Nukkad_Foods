import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget foodTypeToggle(Function(int) onTap, List<bool> isSelected) {
  List<String> types = [
    'Veg',
    'Non-Veg',
    'Vegan',
    'Gluten-Free',
    'Dairy Free',
  ];
  List<String> typeIcons = [
    'assets/icons/veg_icon.png',
    'assets/icons/non_veg_icon.png',
    'assets/icons/vegan_icon.png',
    'assets/icons/gluten_free_icon.png',
    'assets/icons/dairy_free_icon.png',
  ];
  return Padding(
    padding: EdgeInsets.only(left: 2.w),
    child: Container(
      height: 5.h,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: isSelected[0] ? Colors.green : Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 0.2.h,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(typeIcons[0], height: 4.h),
                    SizedBox(width: 2.w),
                    Text(
                      types[0],
                      style: body4TextStyle.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: isSelected[1] ? primaryColor : Colors.white,
                border: Border.all(
                  color: primaryColor,
                  width: 0.2.h,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(typeIcons[1], height: 4.h),
                    Text(
                      types[1],
                      style: body4TextStyle.copyWith(color: textBlack),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: isSelected[2] ? Colors.green : Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 0.2.h,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(typeIcons[2], height: 4.h),
                    Text(
                      types[2],
                      style: body4TextStyle.copyWith(color: textBlack),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(3);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: isSelected[3] ? const Color(0xFFF39406) : Colors.white,
                border: Border.all(
                  color: const Color(0xFFF39406),
                  width: 0.2.h,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(typeIcons[3], height: 4.h),
                    Text(
                      types[3],
                      style: body4TextStyle.copyWith(color: textBlack),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(4);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: isSelected[4] ? Colors.green : Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 0.2.h,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(typeIcons[4], height: 4.h),
                    Text(
                      types[4],
                      style: body4TextStyle.copyWith(color: textBlack),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
