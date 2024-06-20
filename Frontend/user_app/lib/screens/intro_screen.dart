import 'package:flutter/material.dart';
import 'package:user_app/utils/colors.dart';
import '../utils/font-styles.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, dynamic>> _slides = [
    {
      'bgImage': 'assets/images/introbg1.png',
      'image': 'assets/images/intro1.png',
      'text': 'Find Food Stalls',
      'subText':
          'Order from your nearby food vendors and restaurants, while relaxing at your home.'
    },
    {
      'bgImage': 'assets/images/introbg2.png',
      'image': 'assets/images/intro2.png',
      'text': 'Browse Menu',
      'subText': 'Find what you are craving for, and click order'
    },
    {
      'bgImage': 'assets/images/introbg3.png',
      'image': 'assets/images/intro3.png',
      'text': 'Relax !',
      'subText':
          'Sit back and relax while our delivery captain reaches you with your favorite food.'
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              _slides.isNotEmpty ? _slides[_currentPage]['bgImage'] : '',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return buildSlide(index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (index) => buildDot(index),
              ),
            ),
            SizedBox(height: 20.0), // Adjust spacing between dots and button
            if (_currentPage ==
                _slides.length - 1) // Show button only on last slide
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child: buildNextButton(),
              ),
            SizedBox(height: 10), // Fixed space below button area
          ],
        ),
      ),
    );
  }

  Widget buildSlide(int index) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          Image.asset(
            _slides.isNotEmpty ? _slides[index]['image'] : '',
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 20.0),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                _slides.isNotEmpty ? _slides[index]['text'] : '',
                style: TextStyle(
                  fontSize: large,
                  color: colorRed,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Text(
                _slides.isNotEmpty ? _slides[index]['subText'] : '',
                style: TextStyle(fontSize: medium),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 70.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? colorRed : colorGray,
      ),
    );
  }

  Widget buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle button press, navigate to next screen, etc.
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: colorRed, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
      child: Text(
        'Next',
        style: TextStyle(
          color: Colors.white, // Text color
        ),
      ),
    );
  }
}
