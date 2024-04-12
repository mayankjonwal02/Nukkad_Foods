import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Orders/orderSummary.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget placedOrderDetails(_isOngoing, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderSummary(
            isOngoing: _isOngoing,
          ),
        ),
      );
    },
    child: Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 35.5.h,
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
                  height: 15.h,
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
                      SizedBox(width: 3.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          h5Text('Shiva Chinese Wok', textBlack),
                          bodyText1('Saket Nagar, Indore', textLightGrey),
                          Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/timer_icon.svg',
                                  height: 3.h,
                                  color: primaryColor2,
                                ),
                                SizedBox(width: 1.w),
                                bodyText2('30 MINS', textGrey),
                                SizedBox(width: 1.w),
                                Image.asset('assets/icons/dot.png'),
                                SizedBox(width: 1.w),
                                bodyText2('5.4 KM', textGrey),
                              ],
                            ),
                          ),
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
                        SvgPicture.asset(
                          _isOngoing
                              ? 'assets/icons/preparing_icon.svg'
                              : 'assets/icons/delivered_icon.svg',
                          height: _isOngoing ? 3.h : 2.h,
                          color: Colors.white,
                        ),
                        bodyText2(_isOngoing ? 'Preparing' : 'Delivered',
                            Colors.white),
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
                                SvgPicture.asset(
                                  _isOngoing
                                      ? 'assets/icons/track_order_icon.svg'
                                      : 'assets/icons/repeat_order_icon.svg',
                                  color: Colors.white,
                                  height: 2.5.h,
                                ),
                                bodyText2(_isOngoing ? 'Track' : 'Reorder',
                                    Colors.white),
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
    ),
  );
}

class _isOngoing {}
