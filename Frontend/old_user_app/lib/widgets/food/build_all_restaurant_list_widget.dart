import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Controller/food/fetch_all_restaurants_model.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/strings.dart';
import 'package:user_app/widgets/constants/texts.dart';
import 'package:user_app/widgets/customs/Food/allRestaurants.dart';

class BuildAllRestaurantListWidget extends StatelessWidget {
  const BuildAllRestaurantListWidget(
      {super.key, this.fetchAllRestaurantsModel});
  final FetchAllRestaurantsModel? fetchAllRestaurantsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ALL RESTAURANTS',
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                '${fetchAllRestaurantsModel != null ? fetchAllRestaurantsModel!.restaurants!.length : 0} Restaurants delivering to you',
                style: body5TextStyle.copyWith(color: textGrey2),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          child: fetchAllRestaurantsModel != null &&
                  fetchAllRestaurantsModel!.restaurants!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: fetchAllRestaurantsModel!.restaurants!.length,
                  itemBuilder: (context, index) {
                    return restaurant(
                      context: context,
                      restaurantModel:
                          fetchAllRestaurantsModel!.restaurants![index],
                    );
                  },
                )
              : Center(
                  child: Text(AppStrings.noRestaurantsFound),
                ),
        )
      ],
    );
  }
}
