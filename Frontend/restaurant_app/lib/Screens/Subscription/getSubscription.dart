import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/Screens/Subscription/renewSubscription.dart';
import 'package:restaurant_app/Screens/Subscription/subscribe_card.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/customs/WalletBody/viewEarningButton.dart';
import 'package:restaurant_app/homeScreen.dart';
import 'package:sizer/sizer.dart';
import '../../Widgets/customs/WalletBody/referalMap.dart';
import '../../Widgets/customs/WalletBody/walletWidget.dart';

class GetSubscription extends StatefulWidget {
  const GetSubscription({super.key});

  @override
  State<GetSubscription> createState() => _GetSubscriptionState();
}

class _GetSubscriptionState extends State<GetSubscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SubscribeCard(),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
              //   child: SizedBox(
              //     width: 100.w,
              //     child: Text(
              //       'How do refer and earn work?'.toUpperCase(),
              //       style: body3TextStyle,
              //       maxLines: 1,
              //       overflow: TextOverflow.ellipsis,
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.w,
                      // height: 22.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.2.h, color: primaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset('assets/images/subscribe.png'),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Subscribe to Nukkad foods',
                            style: body3TextStyle.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(width: 2.h),
                              Text(
                                '2x New customers',
                                style: body4TextStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(width: 2.h),
                              Text(
                                '3x Repeat customers',
                                style: body4TextStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(width: 2.h),
                              Text(
                                'More Orders',
                                style: body4TextStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(width: 2.h),
                              Text(
                                'More Earnings',
                                style: body4TextStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Stack(
                      //   children: [
                      //     Positioned(
                      //       bottom: -15,
                      //       right: 40,
                      //       child: Image.asset('assets/images/refer_4.png'),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           '4.',
                      //           style:
                      //               h3TextStyle.copyWith(color: primaryColor),
                      //         ),
                      //         SizedBox(
                      //           width: 75.w,
                      //           child: Text(
                      //               'You both earn 50 wallet cash each, that can be used while placing orders. ',
                      //               style: body4TextStyle),
                      //         )
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: mainButton(
                          'Subscribe at just ₹ 399', textWhite, routeHome),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                        child: Text(
                          'For 4 Month',
                          style: body4TextStyle.copyWith(
                              color: primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
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

  routeHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RenewSubscription(),
      ),
    );
  }
}
