import 'package:flutter/material.dart';
import 'dart:async'; // Import the dart:async package
import 'package:user_app/utils/colors.dart';
import 'package:user_app/screens/intro_screen.dart'; // Import the intro screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set up the timer to navigate to the intro screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              IntroScreen(), // Replace with your IntroScreen widget
        ),
      );
    });

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
