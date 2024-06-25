import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget sectionGrid(String headerText, List names, List images) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: textGrey2, width: 0.2.h),
        bottom: BorderSide(color: textGrey2, width: 0.2.h),
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 2.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText.toUpperCase(), style: titleTextStyle),
        SizedBox(
          height: 30.h,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 2.h,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    images[index],
                    height: 8.5.h,
                    scale: 0.6,
                  ),
                  Text(names[index], style: h6TextStyle),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}

// Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 2.w),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 8.5.h,
//                       width: 8.5.h,
//                       child: Image.asset('assets/images/bowl.png'),
//                     ),
//                     Text('Waffle', style: h6TextStyle),
//                   ],
//                 ),
//               );