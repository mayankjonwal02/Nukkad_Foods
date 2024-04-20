import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Profile/savedAddresses.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget AddressWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 2.h),
    decoration: BoxDecoration(
      border: Border.all(
        color: textGrey2,
        width: 0.2.h,
      ),
      borderRadius: BorderRadius.circular(7),
      color: const Color(0xffF7F7F7),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/location_pin_icon.svg',
            height: 4.h,
            color: primaryColor,
          ),
          SizedBox(width: 2.w),
          SizedBox(
            width: 55.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home',
                      style: h5TextStyle,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SavedAddresses(),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/icons/dropdown_icon.svg',
                        height: 3.5.h,
                      ),
                    ),
                  ],
                ),
                Text(
                  '506 B, kanadiya road main road',
                  style: body5TextStyle,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          VerticalDivider(color: textGrey2, thickness: 0.2.h),
          SizedBox(
            width: 25.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup in ',
                  style: body5TextStyle,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '25 mins',
                  style: h5TextStyle,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
