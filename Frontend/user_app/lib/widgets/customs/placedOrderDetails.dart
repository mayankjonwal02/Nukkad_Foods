import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget placedOrderDetails(_isOngoing) {
  return Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: 35.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.2.h, color: textLightGrey),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 14.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      bottom: BorderSide(width: 0.2.h, color: textLightGrey)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 15.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/restaurantImage.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        h5Text('Shiva Chinese Wok', textBlack),
                        bodyText1('Saket Nagar, Indore', textLightGrey),
                        SizedBox(height: 0.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/clock.png'),
                            SizedBox(width: 1.w),
                            bodyText2('30 MINS', textGrey),
                            SizedBox(width: 1.w),
                            Image.asset('assets/icons/dot.png'),
                            SizedBox(width: 1.w),
                            bodyText2('5.4 KM', textGrey),
                          ],
                        ),
                        SizedBox(width: 1.h),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  height: 3.5.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: _isOngoing ? Colors.green : textGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(_isOngoing
                          ? 'assets/icons/preparing.png'
                          : 'assets/icons/delivering.png'),
                      bodyText2(
                          _isOngoing ? 'Preparing' : 'Delivered', Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bodyText1('1 x Fried Rice', textBlack),
                bodyText1('1 x Schezwan Noodles', textBlack),
                Divider(
                  thickness: 0.2.h,
                  color: textLightGrey,
                  endIndent: 40.w,
                ),
                Row(
                  children: [
                    bodyText1('Total', textBlack),
                    Spacer(),
                    Spacer(),
                    bodyText1('₹ 250', textBlack),
                    Spacer()
                  ],
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 0.2.h,
                  dashLength: 2.5.w,
                  dashColor: textGrey,
                  dashGapLength: 1.w,
                  dashGapColor: Colors.transparent,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.h),
                        bodyText1('Estimated delivery time', textGrey),
                        bodyText2('18:56 PM', textBlack),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor2,
                        child: Container(
                          height: 3.5.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: primaryColor2,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _isOngoing
                                  ? Image.asset('assets/icons/track.png')
                                  : Image.asset('assets/icons/repeat.png'),
                              _isOngoing
                                  ? bodyText2('Track', Colors.white)
                                  : bodyText2('Reorder', Colors.white),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
