import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/strings.dart';
import 'package:user_app/widgets/constants/texts.dart';

Widget restaurantMenuScroll(
    List<bool> isMenuSelected, Function(int) onTap, List<String> categories) {
  return Container(
    padding: EdgeInsets.only(right: 1.w),
    width: 23.w,
    color: textWhite,
    child: categories.length == 0
        ? Center(
            child: Text(
              AppStrings.noCategoriesFound,
            ),
          )
        : ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return SizedBox(
                // height: 15.h,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTap(index);
                      },
                      child: Container(
                        height: 7.h,
                        width: 23.w,
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color:
                              isMenuSelected[index] ? primaryColor : textWhite,
                        ),
                        child: Image.asset('assets/images/bowl_2.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Text(
                        categories[index].replaceAll("_", " "),
                        style: isMenuSelected[index]
                            ? h6TextStyle.copyWith(color: primaryColor)
                            : body5TextStyle.copyWith(color: textGrey2),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
  );
}
