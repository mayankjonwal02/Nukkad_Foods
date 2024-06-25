import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget sectionSlider(String headerText, List names, List images) {
  return SizedBox(
    height: 26.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
          child: Text(headerText.toUpperCase(), style: titleTextStyle),
        ),
        SizedBox(
          height: 20.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: names.isEmpty ? 5 : names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: SizedBox(
                    height: 17.h,
                    width: 12.h,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                          width: 12.h,
                          child: Image.asset('assets/images/waffle.png'),
                        ),
                        Text(
                          'Pizza Hut Waffle',
                          style: h6TextStyle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    ),
  );
}
