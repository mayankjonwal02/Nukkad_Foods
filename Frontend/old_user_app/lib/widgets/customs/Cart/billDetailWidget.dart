import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Cart/savingsWidget.dart';

Widget detailedBill(BuildContext context) {
  return Material(
    elevation: 3,
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: textGrey2,
          width: 0.2.h,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/view_bill_icon.png',
            color: primaryColor,
            height: 4.h,
          ),
          SizedBox(width: 2.w),
          Container(
            width: 55.w,
            padding: EdgeInsets.symmetric(vertical: 0.5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'View Detailed Bill',
                  style: body4TextStyle.copyWith(
                    fontSize: 14.sp,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                Text(
                  'Inc. Taxes, fees, and charges',
                  style: body5TextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              _showDetailedBillBottomSheet(context);
            },
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: primaryColor,
              size: 20.sp,
            ),
          )
        ],
      ),
    ),
  );
}

void _showDetailedBillBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Total Bill',
                      style: h4TextStyle.copyWith(color: primaryColor),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryColor,
                        size: 20.sp,
                        weight: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  border: Border.all(color: textGrey2, width: 0.2.h),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff7f7f7),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/food_home_icon.svg',
                            color: textBlack,
                            height: 4.h,
                          ),
                          Text(
                            'Food Total',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '₹ 220',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/gst_taxes_icon.svg',
                            color: textBlack,
                            height: 4.h,
                          ),
                          Text(
                            'GST & Taxes',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '₹ 4.64',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/handling_icon.svg',
                            color: textBlack,
                            height: 4.h,
                          ),
                          Text(
                            'Handling Charges',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '₹ 8.87',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/distance_fee_icon.svg',
                            color: textBlack,
                            height: 3.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Delivery Fee',
                                style: body4TextStyle.copyWith(
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'For ₹220',
                                style:
                                    body5TextStyle.copyWith(color: textGrey2),
                              ),
                            ],
                          ),
                          Text(
                            '₹ 15.43',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/track_order_icon.svg',
                            color: textBlack,
                            height: 4.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Delivery Fee',
                                style: body4TextStyle.copyWith(
                                    fontWeight: FontWeight.w300),
                              ),
                              Text('For 5.4 KM',
                                  style: body5TextStyle.copyWith(
                                      color: textGrey2)),
                            ],
                          ),
                          Text(
                            '₹ 16.99',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: textGrey2,
                      thickness: 0.2.h,
                      indent: 5.w,
                      endIndent: 5.w,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/coupon_icon.svg',
                            color: textBlack,
                            height: 5.h,
                          ),
                          Text(
                            'Delivery Fee',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '₹ 16.99',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/wallet_icon.svg',
                            color: textBlack,
                            height: 4.h,
                          ),
                          Text(
                            'Delivery Fee',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '₹ 16.99',
                            style: body4TextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: textGrey2,
                      thickness: 0.2.h,
                      indent: 5.w,
                      endIndent: 5.w,
                    ),
                    Container(
                      height: 6.h,
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFe7ffe5),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colorSuccess),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grand Total',
                            style: h4TextStyle.copyWith(color: colorSuccess),
                          ),
                          Text(
                            '₹ 202',
                            style: h4TextStyle.copyWith(color: colorSuccess),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SavingsWidget()
            ],
          ),
        ),
      );
    },
  );
}
