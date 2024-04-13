import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:user_app/Widgets/constants/colors.dart';

Widget adsSlider() {
  final List<String> imgList = [
    'assets/images/ad.jpg',
    'assets/images/ad.jpg',
    'assets/images/ad.jpg',
  ];
  return Container(
    height: 20.h,
    margin: EdgeInsets.symmetric(horizontal: 2.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imgList[index],
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: imgList.length,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: primaryColor,
            color: textGrey3,
          ),
        ),
      ),
    ),
  );
}
