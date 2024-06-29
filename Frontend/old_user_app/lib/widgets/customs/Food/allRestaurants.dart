import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Controller/food/fetch_all_restaurants_model.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/ratingWidget.dart';
import 'package:user_app/screens/Restaurant/restaurantScreen.dart';
import 'package:user_app/widgets/customs/network_image_widget.dart';

Widget allRestaurants(
    {required BuildContext context,
    /* String restaurantName*/ required List<Restaurants> restaurantsList}) {
  return SizedBox(
    height: 75.h,
    child: ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return restaurant(
          context: context,
          restaurantModel: restaurantsList[index],
        );
      },
    ),
  );
}

Widget restaurant(
    {required BuildContext context,
    required Restaurants restaurantModel,
    String? restaurantName = ""}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RestaurantScreen(
                    restaurantID: restaurantModel.id ?? "",
                  )));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 15.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2.h, color: textGrey3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      height: 15.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: NetworkImageWidget(
                        imageUrl: restaurantModel.restaurantImages![0],
                        height: 15.h,
                        width: 28.w,
                      )
                      // child: Image.asset(
                      //   'assets/images/restaurantImage.png',
                      //   fit: BoxFit.fill,
                      // ),
                      ),
                  Positioned(
                    bottom: 1.h,
                    left: 1.5.w,
                    right: 1.5.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/unlike_heart_icon.svg',
                          height: 3.h,
                        ),
                        ratingWidget(4.1)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Text(
                            restaurantModel.nukkadName ?? "",
                            style: h5TextStyle.copyWith(fontSize: 14.sp),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      _buildMoreWidget(),
                    ],
                  )),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        restaurantModel.nukkadAddress ?? "",
                        style: body4TextStyle.copyWith(color: textGrey2),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/timer_icon.svg',
                              height: 3.h,
                              color: primaryColor,
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: Text(
                                '30 MINS',
                                style: body5TextStyle.copyWith(
                                  color: textGrey1,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/dot.svg',
                            height: 2.h,
                            color: textGrey1,
                          ),
                          Expanded(
                            child: Text(
                              '5.4 KM',
                              style: body5TextStyle.copyWith(color: textGrey1),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ))
                ],
              )),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildMoreWidget() => PopupMenuButton(
      color: const Color(0xFFB8B8B8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onSelected: (value) {
        if (value == 'hide') {
          // Implement your edit action here
        } else if (value == 'share') {
          // Implement your delete action here
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'hide',
          child: SizedBox(
            width: 40.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.visibility_off_outlined,
                  color: textBlack,
                  size: 15.sp,
                ),
                SizedBox(width: 1.5.w),
                Text('Hide Restaurant', style: body4TextStyle),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 'share',
          child: SizedBox(
            width: 42.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.share_outlined,
                  color: textBlack,
                  size: 15.sp,
                ),
                SizedBox(width: 1.5.w),
                Text('Share Restaurant', style: body4TextStyle),
              ],
            ),
          ),
        ),
      ],
    );
