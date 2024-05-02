import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Food/adsSlider.dart';
import 'package:user_app/Widgets/customs/Food/allRestaurants.dart';
import 'package:user_app/Widgets/customs/Food/appBar.dart';
import 'package:user_app/Widgets/customs/Food/offersSlider.dart';
import 'package:user_app/Widgets/customs/Food/restaurantSlider.dart';
import 'package:user_app/Widgets/customs/Food/searchBar.dart';
import 'package:user_app/Widgets/customs/Food/sectionGrid.dart';
import 'package:user_app/Widgets/customs/Food/sectionSlider.dart';

class FoodBody extends StatefulWidget {
  const FoodBody({super.key});

  @override
  State<FoodBody> createState() => _FoodBodyState();
}

class _FoodBodyState extends State<FoodBody> {
  List<String> restaurantNames = [
    'The Hungry Panda',
    'Casa di Pizza',
    'Taste of India',
    'The Burger Joint',
    'Sushi Heaven',
    'Mama Mia Pizzeria',
    'Golden Dragon',
    'Café Paris',
    'Thai Orchid',
    'Mexican Grill',
    'Sunrise Diner',
    'Noodle House',
    'Deli Delight',
    'Taco Time',
    'The Cheesesteak Shop',
    'Pizza Palace',
    'Burger Barn',
    'Tandoori Palace',
    'The Sandwich Spot',
    'Falafel House',
    'Wok & Roll',
    'Grill House',
    'Sizzling Steaks',
    'Fried Chicken Co.',
    'The Pasta House',
    'Taco Haven',
    'Sushi Samurai',
    'Peking Duck House',
    'Mediterranean Grill',
    'Bagel Bistro',
    'Curry Express',
    'Seafood Shack',
    'Veggie Delight',
    'Hot Wok',
    'Ramen Ramble',
    'Wrap It Up',
    'Gourmet Garden',
    'Pita Pit',
    'Crepe Café',
    'Crispy Crust Pizza',
    'Waffle House',
    'Dim Sum Palace',
    'BBQ Junction',
    'Soup Station',
    'Cajun Cookhouse',
    'Greek Taverna',
    'The Vegan Café',
    'Taste of China',
    'Szechuan Spice',
    'French Bistro',
    'Dumpling Dynasty',
    'Nacho Nation',
    'Fusion Fare',
    'Fajita Fiesta',
    'Pancake Paradise',
    'Kebab Corner',
    'Rice Bowl',
    'Sizzling Sausages',
    'Dosa Diner',
    'Smoothie Station',
    'Burrito Bar',
    'Falafel Factory',
    'Baguette Bakery',
    'Poke Paradise',
    'Sushi Samba',
    'Tandoori Twist',
    'Pita Palace',
    'Deli Supreme',
    'Wok Star',
    'The Hotdog Hut',
    'Thai Terrace',
    'Baklava Bistro',
    'Pancake Place',
    'Mongolian Grill',
    'Grill Master',
    'The Wrap Shack',
    'Samosa Stop',
    'Banh Mi Bistro',
    'Pizza Pit',
    'The Burrito Bowl',
    'Noodle Nook',
  ];

  List<String> restaurantImages = List.filled(85, 'assets/images/bowl.png');

  List foodCategories = [
    'Bowl1',
    'Bowl2',
    'Bowl3',
    'Bowl4',
    'Bowl5',
    'Bowl6',
    'Bowl7',
    'Bowl8'
  ];
  List foodImages = [
    'assets/images/bowl_1.png',
    'assets/images/bowl_2.png',
    'assets/images/bowl_3.png',
    'assets/images/bowl_1.png',
    'assets/images/bowl_2.png',
    'assets/images/bowl_3.png',
    'assets/images/bowl_1.png',
    'assets/images/bowl_2.png',
  ];
  List offerData = [];

  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadMoreRestaurants();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _loadMoreRestaurants();
    }
  }

  void _loadMoreRestaurants() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        restaurantNames.addAll([
          'New Restaurant ${restaurantNames.length + 1}',
          'New Restaurant ${restaurantNames.length + 2}',
        ]);
        restaurantImages.addAll(['new_image_url1', 'new_image_url2']);
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          const customAppBar(),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              child: searchBar('What are you looking for?'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              child: adsSlider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Container(
              margin: EdgeInsets.only(left: 2.w),
              child: sectionSlider(
                'Favorite Merchants',
                restaurantNames,
                restaurantImages,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              child: sectionGrid(
                'Hey, What\'s on your mind?',
                foodCategories,
                foodImages,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            child: offersSlider('Curated for you', offerData),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.only(bottom: 2.h),
              child: Text(
                'Restaurants near me'.toUpperCase(),
                style: titleTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.only(bottom: 2.h),
              child: Text(
                'Quick Delivery',
                style: h5TextStyle,
              ),
            ),
          ),
          Container(
            height: 30.h,
            padding: EdgeInsets.only(top: 3.h, left: 2.w, bottom: 3.h),
            color: const Color(0xFFfee5ec),
            child: restaurantSlider(context),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
              child: Text(
                'Nearest Restaurants',
                style: h5TextStyle,
              ),
            ),
          ),
          Container(
            height: 30.h,
            color: const Color(0xFFfee5ec),
            padding: EdgeInsets.only(top: 3.h, left: 2.w, bottom: 3.h),
            child: restaurantSlider(context),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
              child: Text(
                'Latest Restaurants',
                style: h5TextStyle,
              ),
            ),
          ),
          Container(
            height: 30.h,
            padding: EdgeInsets.only(top: 3.h, left: 2.w, bottom: 3.h),
            color: const Color(0xFFfee5ec),
            child: restaurantSlider(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
            child: Divider(
              color: textGrey3,
              thickness: 0.2.h,
              indent: 3.w,
              endIndent: 3.w,
            ),
          ),
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
                  '${restaurantNames.length} Restaurants delivering to you',
                  style: body5TextStyle.copyWith(color: textGrey2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            height: 70.h,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurantNames.length,
              itemBuilder: (context, index) {
                if (index == restaurantNames.length) {
                  {
                    return Column(
                      children: [
                        restaurant(context, restaurantNames[index]),
                        const CircularProgressIndicator(),
                      ],
                    );
                  }
                } else {
                  return restaurant(context, restaurantNames[index]);
                }
              },
            ),
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
