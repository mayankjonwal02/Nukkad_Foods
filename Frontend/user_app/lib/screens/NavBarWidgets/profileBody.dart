import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Profile/aboutPage.dart';
import 'package:user_app/Screens/Profile/editProfile.dart';
import 'package:user_app/Screens/Profile/favouriteRestaurant.dart';
import 'package:user_app/Screens/Support/feedbackScreen.dart';
import 'package:user_app/Screens/Profile/hiddenRestaurant.dart';
import 'package:user_app/Screens/Profile/savedAddresses.dart';
import 'package:user_app/Screens/loginScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/customs/Profile/header.dart';
import 'package:user_app/Widgets/customs/Profile/profileButton.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        children: [
          profileHeader(),
          Container(
            height: 50.5.h,
            width: 100.w,
            color: Color(0xFFf7f7f7),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  color: const Color(0xFFf7f7f7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      button(
                        'Edit Profile',
                        SvgPicture.asset(
                          'assets/icons/edit_icon.svg',
                          height: 3.h,
                          color: textBlack,
                        ),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()),
                          );
                        },
                      ),
                      Divider(
                        color: textGrey,
                        thickness: 0.2.h,
                        endIndent: 10.w,
                        indent: 10.w,
                      ),
                      button(
                        'Favourites',
                        Container(
                          height: 3.h,
                          width: 3.h,
                          child: Image.asset(
                            'assets/icons/heart.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavouriteRestaurants()),
                          );
                        },
                      ),
                      Divider(
                        color: textGrey,
                        thickness: 0.2.h,
                        endIndent: 10.w,
                        indent: 10.w,
                      ),
                      button(
                        'Hidden Restaurants',
                        Icon(
                          Icons.visibility_off_outlined,
                          size: 22.sp,
                          color: textBlack,
                        ),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HiddenRestaurants()),
                          );
                        },
                      ),
                      Divider(
                        color: textGrey,
                        thickness: 0.2.h,
                        endIndent: 10.w,
                        indent: 10.w,
                      ),
                      button(
                        'Saved Addresses',
                        SvgPicture.asset(
                          'assets/icons/address_book_icon.svg',
                          height: 3.h,
                          color: textBlack,
                        ),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedAddresses()),
                          );
                        },
                      ),
                      Divider(
                        color: textGrey,
                        thickness: 0.2.h,
                        endIndent: 10.w,
                        indent: 10.w,
                      ),
                      button(
                        'About',
                        SvgPicture.asset(
                          'assets/icons/about_icon.svg',
                          height: 3.5.h,
                          color: textBlack,
                        ),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()),
                          );
                        },
                      ),
                      Divider(
                        color: textGrey,
                        thickness: 0.2.h,
                        endIndent: 10.w,
                        indent: 10.w,
                      ),
                      button(
                        'Send Feedback',
                        SvgPicture.asset(
                          'assets/icons/feedback_icon.svg',
                          height: 3.h,
                          color: textBlack,
                        ),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedbackScreen()),
                          );
                        },
                      ),
                      Divider(
                        color: textGrey,
                        thickness: 0.2.h,
                        endIndent: 10.w,
                        indent: 10.w,
                      ),
                      button(
                        'Report',
                        SvgPicture.asset(
                          'assets/icons/report.svg',
                          semanticsLabel: 'Report',
                          color: textBlack,
                        ),
                        () {},
                      ),
                      Divider(
                        color: textGrey,
                        thickness: 0.2.h,
                        endIndent: 10.w,
                        indent: 10.w,
                      ),
                      button(
                        'Logout',
                        Icon(
                          Icons.logout,
                          size: 20.sp,
                          color: textBlack,
                        ),
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
