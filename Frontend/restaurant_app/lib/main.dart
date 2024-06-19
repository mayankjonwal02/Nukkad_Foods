import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Screens/splashScreen.dart';
import 'package:restaurant_app/firebase_options.dart';
import 'package:sizer/sizer.dart';
import 'package:restaurant_app/Widgets/constants/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'provider/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtil().init();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print('Error loading .env file: $e');
  }

  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Nukkad Foods',
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
          );
        },
      ),
    );
  }
}
