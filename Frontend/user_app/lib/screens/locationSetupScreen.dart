import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/loginScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/screens/homeScreen.dart';
import 'package:user_app/widgets/buttons/mainButton.dart';
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
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
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
              Text(
                "What’s your location?",
                style: h1TextStyle.copyWith(color: primaryColor),
              ),
              SizedBox(height: 8.h),
              Text(
                'Location needed to show stalls/ food trucks near you and deliver to you accurately.',
                style: body2TextStyle.copyWith(
                  fontSize: 17.sp,
                  color: textBlack,
                  fontWeight: FontWeight.w100,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              mainButton('Allow Location Access', Colors.white, routeHome),
              SizedBox(height: 1.h),
              TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent,
                )),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Enter Location Manually',
                  style: h5TextStyle.copyWith(color: primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
