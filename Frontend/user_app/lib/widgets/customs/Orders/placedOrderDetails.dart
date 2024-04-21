import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Orders/orderSummary.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget placedOrderDetails(bool _isOngoing, BuildContext context) {
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
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.2.h, color: textGrey3),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(width: 0.2.h, color: textGrey3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/restaurantImage.png',
                        fit: BoxFit.fill,
                        height: 14.h,
                        width: 28.w,
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shiva Chinese Wok',
                                style: h5TextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Saket Nagar, Indore',
                                style: body5TextStyle.copyWith(
                                  color: textGrey2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/timer_icon.svg',
                                      height: 3.h,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: 1.w),
                                    Text(
                                      '25 min',
                                      style: body5TextStyle.copyWith(
                                        color: textGrey1,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/dot.svg',
                                      height: 2.h,
                                      color: textGrey1,
                                    ),
                                    Text(
                                      '4.5',
                                      style: body5TextStyle.copyWith(
                                        color: textGrey1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 1.w,
                  right: 1.w,
                  child: Container(
                    height: 3.5.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        color: _isOngoing ? Colors.green : textGrey2,
                        borderRadius: BorderRadius.circular(6)),
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
                        Text(
                          _isOngoing ? 'Preparing' : 'Delivered',
                          style: body5TextStyle.copyWith(
                            color: textWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1 x Fried Rice', style: body4TextStyle),
                  Text('1 x Schezwan Noodles', style: body4TextStyle),
                  Divider(
                    thickness: 0.2.h,
                    color: textGrey3,
                    endIndent: 35.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.5.h),
                    child: Row(
                      children: [
                        Text('Total', style: body5TextStyle),
                        Spacer(),
                        Spacer(),
                        Text('₹ 250', style: h6TextStyle),
                        Spacer()
                      ],
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 0.2.h,
                    dashLength: 2.5.w,
                    dashColor: textGrey2,
                    dashGapLength: 1.w,
                    dashGapColor: Colors.transparent,
                  ),
                  Container(
                    height: 6.5.h,
                    padding: EdgeInsets.only(top: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimated delivery time',
                              style: body4TextStyle.copyWith(
                                fontSize: 11.sp,
                                color: textGrey2,
                              ),
                            ),
                            Text('18:56 PM', style: body5TextStyle),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                            child: Container(
                              height: 3.5.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    _isOngoing
                                        ? 'assets/icons/track_order_icon.svg'
                                        : 'assets/icons/repeat_order_icon.svg',
                                    color: Colors.white,
                                    height: 2.5.h,
                                  ),
                                  Text(
                                    _isOngoing ? 'Track' : 'Reorder',
                                    style: body4TextStyle.copyWith(
                                        color: textWhite),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
