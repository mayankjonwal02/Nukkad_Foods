import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/allRestaurants.dart';

class HiddenRestaurants extends StatefulWidget {
  const HiddenRestaurants({super.key});

  @override
  State<HiddenRestaurants> createState() => _HiddenRestaurantsState();
}

class _HiddenRestaurantsState extends State<HiddenRestaurants> {
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
        title: h4Text('Hidden Restaurants', textBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            restaurant(context),
            restaurant(context),
            restaurant(context),
          ],
        ),
      ),
    );
  }
}
