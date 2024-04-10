import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget sectionSlider(String headerText, List names, List images) {
  return Container(
    height: 22.h,
    margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 1.h),
            child: h5Text(headerText.toUpperCase(), textBlack)),
        SizedBox(
          height: 17.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: names.isEmpty ? 5 : names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 6.h,
                      ),
                      h6Text('Item $index', textBlack)
                    ],
                  ),
                );
              }),
        ),
      ],
    ),
  );
}
