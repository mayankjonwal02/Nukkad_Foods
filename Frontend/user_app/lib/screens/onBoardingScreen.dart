import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/loginScreen.dart';
import 'package:user_app/widgets/constants/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<OnBoardingScreenState>();
  int currentPageIndex = 0;

  void _onPageChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  Widget _buildImage(String assetName) {
    return Padding(
      padding: EdgeInsets.only(top: 9.h),
      child: Image.asset(
        'assets/images/introduction/$assetName',
        width: 98.w,
      ),
    );
  }

  routeLogin() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: primaryColor2,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18.sp,
        fontFamily: 'Poppins',
        color: textBlack,
        fontWeight: FontWeight.w300,
      ),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: currentPageIndex != 2
                ? TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                    onPressed: () => routeLogin(),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: textGrey,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
      globalFooter: currentPageIndex == 2
          ? Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => primaryColor2,
                    ),
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 2.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => routeLogin(),
                ),
              ),
            )
          : SizedBox(
              height: 15.2.h,
            ),
      pages: [
        PageViewModel(
          title: "Find Food Stalls",
          body:
              "Order from your nearby food vendors and restaurants, while relaxing at your home.",
          image: _buildImage('page_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Browse Menu",
          body: "Find what you are craving for, and click order.",
          image: _buildImage('page_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Relax!",
          body:
              "Sit back and relax while our delivery captain reaches you with your favorite food.",
          image: _buildImage('page_3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {},
      onSkip: () {},
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: false,
      showNextButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.all(12.0),
      dotsDecorator: DotsDecorator(
        size: Size(1.5.h, 1.2.h),
        color: textLightGrey,
        activeSize: Size(1.5.h, 1.5.h),
        activeColor: primaryColor2,
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onChange: _onPageChange,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:sizer/sizer.dart';
// import 'package:user_app/widgets/constants/colors.dart';
// import 'package:user_app/widgets/constants/texts.dart';

// import 'loginScreen.dart';

// class OnBoardingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return OnBoardingSlider(
//       headerBackgroundColor: Colors.white,
//       addButton: false,
//       finishButtonText: 'Register',
//       centerBackground: true,
//       finishButtonStyle: FinishButtonStyle(
//         backgroundColor: Colors.black,
//       ),
//       trailing: h5Text('Skip', textGrey),
//       background: [
//         Image.asset(
//           'assets/images/introduction/bg_1.png',
//           fit: BoxFit.cover, // Ensures the image covers the entire screen
//         ),
//         Image.asset(
//           'assets/images/introduction/bg_2.png',
//           fit: BoxFit.cover,
//         ),
//         Image.asset(
//           'assets/images/introduction/bg_3.png',
//           fit: BoxFit.cover,
//         ),
//       ],
//       totalPage: 3,
//       speed: 1.8,
//       pageBodies: [
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             children: <Widget>[
//               SizedBox(),
//               Text('Description Text 1'),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             children: <Widget>[
//               SizedBox(),
//               Text('Description Text 2'),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             children: <Widget>[
//               SizedBox(),
//               Text('Description Text 3'),
//             ],
//           ),
//         ),
//       ],
//       indicatorPosition: 60.h,
//       onFinish: () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LoginScreen(),
//           ),
//         );
//       },
//       trailingFunction: () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LoginScreen(),
//           ),
//         );
//       },
//     );
//   }
// }
