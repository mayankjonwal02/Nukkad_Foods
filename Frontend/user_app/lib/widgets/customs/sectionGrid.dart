import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget sectionGrid(String headerText, List names, List images) {
  return Container(
    height: 35.h,
    margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        h5Text(headerText.toUpperCase(), textBlack),
        SizedBox(
          height: 30.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 2.h,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 4.h,
                    ),
                    bodyText1('Item $index', textBlack),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
