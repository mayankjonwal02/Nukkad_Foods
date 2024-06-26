import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/splashScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print('Error loading .env file: $e');
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Nukkad Foods',
          theme: ThemeData(
              useMaterial3: true,
              timePickerTheme: const TimePickerThemeData(
                dialHandColor: primaryColor,
                backgroundColor: textWhite,
                dayPeriodColor: textGrey3,
                dialBackgroundColor: textGrey2,
                hourMinuteColor: bgColor,
                entryModeIconColor: textBlack,
              ),
              textTheme: GoogleFonts.poppinsTextTheme()),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
