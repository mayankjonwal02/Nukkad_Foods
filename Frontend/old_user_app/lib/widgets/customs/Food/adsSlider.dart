import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/screens/rewards/rewardsScreen.dart';
import 'package:user_app/widgets/constants/texts.dart';

class AdsSlider extends StatefulWidget {
  @override
  _AdsSliderState createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      child: Stack(
        children: [
          Container(
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RewardsScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/ads/ad1bg.png'), // path to your background image
                                fit: BoxFit.cover,
                              ),
                              gradient: LinearGradient(
                                colors: [Color(0xFF17A1FA), Color(0xFF9747FF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/ads/batch.png'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Foodie Rewards!',
                                        style: TextStyle(
                                          color: Color(
                                            0xFFFFCE5B,
                                          ),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/rewards.png',
                                          height: 90,
                                          width: 90,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/fire.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '2 Days daily streak',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/wallet_2.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Earn ₹199 in wallet  ',
                                                style: TextStyle(
                                                  color: Color(0xFFFFCE5B),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    case 1:
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/ads/ad2bg.png'), // path to your background image
                              fit: BoxFit.cover,
                            ),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFFA2CD), Color(0xFFFF0660)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  'Be a Premium member!',
                                  style: TextStyle(
                                    color: Color(
                                      0xFFFFCE5B,
                                    ),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'assets/images/ads/diamond.png',
                                        height: 90,
                                        width: 90,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Standard, Corporate and Foodie. \n3 Premium modes To Choose from',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    case 2:
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF008D0C), Color(0xFF5AD746)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  'Refer and Earn!',
                                  style: TextStyle(
                                    color: Color(
                                      0xFFFFCE5B,
                                    ),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'assets/images/ads/speaker.png',
                                        height: 90,
                                        width: 90,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Complete 3 Orders to Unlock refer \nand earn program!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    default:
                      return Container();
                  }
                },
                itemCount: 3,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.all(2.0),
                  width: _currentIndex == index ? 10.0 : 8.0,
                  height: _currentIndex == index ? 10.0 : 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? primaryColor : textGrey3,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
