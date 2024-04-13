import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget sectionSlider(String headerText, List names, List images) {
  return SizedBox(
    height: 22.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text(headerText.toUpperCase(), style: h5TextStyle),
        ),
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
                      SizedBox(
                        height: 12.h,
                        width: 12.h,
                        child: Image.asset('assets/images/waffle.png'),
                      ),
                      Text('Waffle', style: h6TextStyle),
                    ],
                  ),
                );
              }),
        ),
      ],
    ),
  );
}
