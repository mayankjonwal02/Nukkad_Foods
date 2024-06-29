import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Controller/food/fetch_all_restaurants_model.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/ratingWidget.dart';
import 'package:user_app/screens/Restaurant/restaurantScreen.dart';
import 'package:user_app/widgets/constants/strings.dart';

Widget restaurantSlider(BuildContext context,
    {FetchAllRestaurantsModel? restaurants}) {
  return restaurants != null && restaurants.restaurants!.isNotEmpty
      ? ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RestaurantScreen(
                              restaurantID:
                                  restaurants.restaurants![index].id ?? "",
                            )));
              },
              child: Container(
                height: 23.h,
                width: 33.w,
                margin: EdgeInsets.only(right: 3.w),
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.2.h, color: textGrey3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.5.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 16.h,
                            child: Image.asset(
                              'assets/images/restaurantImage.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            bottom: 1.5.h,
                            left: 1.w,
                            right: 1.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/unlike_heart_icon.svg',
                                  height: 3.h,
                                  color: Colors.white,
                                ),
                                ratingWidget(2.5),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 0.03.h,
                      color: textGrey2,
                      indent: 1.w,
                      endIndent: 1.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Text(
                        'Shiva Chinese',
                        style: h6TextStyle,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/timer_icon.svg',
                          color: primaryColor,
                          height: 3.h,
                        ),
                        Text(
                          '20 Mins',
                          style: body6TextStyle.copyWith(
                              color: textGrey1, fontWeight: FontWeight.w200),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SvgPicture.asset(
                          'assets/icons/dot.svg',
                          height: 2.h,
                          color: textGrey1,
                        ),
                        Text(
                          '4 KM',
                          style: body6TextStyle.copyWith(
                              color: textGrey1, fontWeight: FontWeight.w200),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      : Center(
          child: Text(
            AppStrings.noRestaurantsFound,
          ),
        );
}
