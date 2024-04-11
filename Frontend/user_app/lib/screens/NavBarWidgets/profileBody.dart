import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Profile/aboutPage.dart';
import 'package:user_app/Screens/Profile/editProfile.dart';
import 'package:user_app/Screens/Profile/favouriteRestaurant.dart';
import 'package:user_app/Screens/Profile/feedbackScreen.dart';
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
            height: 51.h,
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
                        Image.asset('assets/icons/edit.png'),
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
                        Image.asset('assets/icons/heart.png'),
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
                        Image.asset('assets/icons/contact.png'),
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
                        Image.asset('assets/icons/info.png'),
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
                        Image.asset('assets/icons/feedback.png'),
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
                        Icon(
                          Icons.flag_outlined,
                          size: 22.sp,
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
                        'Logout',
                        Icon(
                          Icons.logout,
                          size: 22.sp,
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
