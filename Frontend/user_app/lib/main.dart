import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/homeScreen.dart';

import 'package:user_app/Screens/splashScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          title: 'Nukkad Foods',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
