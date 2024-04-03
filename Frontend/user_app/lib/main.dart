import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/screens/loginScreen.dart';

import 'screens/onBoardingScreen.dart';
import 'screens/splashScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Nukkad Foods User App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/onboarding': (context) => const OnBoardingScreen(),
            '/login': (context) => const LoginScreen(),
          },
        );
      },
    );
  }
}
