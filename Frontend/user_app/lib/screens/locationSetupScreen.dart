import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/homeScreen.dart';
import 'package:user_app/screens/loginScreen.dart';
import 'package:user_app/widgets/buttons/mainButton.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

class LocationSetupScreen extends StatefulWidget {
  const LocationSetupScreen({super.key});

  @override
  State<LocationSetupScreen> createState() => _LocationSetupScreenState();
}

class _LocationSetupScreenState extends State<LocationSetupScreen> {
  void routeHome() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/location_page_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              h2Text("What’s your location?", primaryColor2),
              SizedBox(height: 13.h),
              Text(
                'Location needed to show stalls/ food trucks near you and deliver to you accurately.',
                style: TextStyle(
                  color: textBlack,
                  fontFamily: 'Poppins',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 9.h),
              mainButton('Allow Location Access', Colors.white, routeHome),
              SizedBox(height: 2.h),
              TextButton(
                style: TextButton.styleFrom(shadowColor: Colors.transparent),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: LoginScreen(),
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 200),
                    ),
                  );
                },
                child: h5Text(
                  'Enter Location Manually',
                  primaryColor2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
