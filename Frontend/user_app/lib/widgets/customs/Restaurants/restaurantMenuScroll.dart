import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget restaurantMenuScroll(List<bool> isMenuSelected, Function() onTap) {
  // Function for unselected text
  Widget unSelectedText(String data) {
    return Text(
      data,
      style: body5TextStyle.copyWith(
        color: textGrey2,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  // Function for selected text
  Widget selectedText(String data) {
    return Text(
      data,
      style: body4TextStyle.copyWith(
        color: primaryColor,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  return Container(
    width: 23.w,
    child: ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 14.h,
          child: Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 7.h,
                  width: 23.w,
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: primaryColor,
                  ),
                ),
              ),
              isMenuSelected[0]
                  ? selectedText('Main Course')
                  : unSelectedText('Main Course'),
            ],
          ),
        );
      },
    ),
  );
}
