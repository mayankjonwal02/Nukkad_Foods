import 'package:flutter/material.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/utils/font-styles.dart';
import 'package:user_app/widgets/common/full_width_red_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'What’s  your location?',
                style: TextStyle(
                    fontSize: extraLarge,
                    fontWeight: FontWeight.bold,
                    color: colorRed),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              textAlign: TextAlign.left,
              'Location needed to show stalls/ ftrucks near you and deliver to you accurately.',
              style: TextStyle(
                fontSize: mediumLarge,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FullWidthRedButton(
                label: 'ALLOW LOCATION ACCESS', onPressed: () {}),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Enter Location Manually',
              style: TextStyle(
                color: colorRed,
                fontWeight: FontWeight.bold,
                fontSize: medium,
              ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/buildings.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
