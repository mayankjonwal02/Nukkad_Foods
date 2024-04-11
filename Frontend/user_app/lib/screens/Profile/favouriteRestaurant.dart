import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/allRestaurants.dart';

class FavouriteRestaurants extends StatefulWidget {
  const FavouriteRestaurants({super.key});

  @override
  State<FavouriteRestaurants> createState() => _FavouriteRestaurantsState();
}

class _FavouriteRestaurantsState extends State<FavouriteRestaurants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: h4Text('Favourite Restaurants', textBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            restaurant(),
            restaurant(),
            restaurant(),
          ],
        ),
      ),
    );
  }
}
