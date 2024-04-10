import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget offersSlider(String headerText, List offerData) {
  return Container(
    height: 13.h,
    margin: EdgeInsets.symmetric(vertical: 1.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 1.h),
          child: h5Text(headerText.toUpperCase(), textBlack),
        ),
        Container(
          height: 7.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF5dcbfd),
                        Color(0xFF5e64e5),
                        Color(0xFF6200d0)
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/offer.png'),
                      SizedBox(width: 2.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          h5Text('Upto 60% off', Colors.white),
                          bodyText2('On select restaurants', Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFf9e84c),
                        Color(0xFFf59c2b),
                        Color(0xFFf06217)
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/suprise_box.png'),
                      SizedBox(width: 2.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          h5Text('Upto 60% off', Colors.white),
                          bodyText2('On select restaurants', Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF59d548),
                        Color(0xFF2bae2a),
                        Color(0xFF0f9217)
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/offer_coin.png'),
                      SizedBox(width: 2.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          h5Text('Upto 60% off', Colors.white),
                          bodyText2('On select restaurants', Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
