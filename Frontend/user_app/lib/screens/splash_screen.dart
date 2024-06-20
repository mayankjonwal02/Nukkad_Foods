import 'package:flutter/material.dart';
import 'package:user_app/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: colorGray,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 8,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
