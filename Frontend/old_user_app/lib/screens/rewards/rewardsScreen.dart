import 'package:flutter/material.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ), // Replace with your desired icon
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Foodie Rewards',
                style: h3TextStyle,
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/rewards.png'),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF17A1FA),
                      Color(0xFF9747FF)
                    ], // Replace with your desired colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    // Image on the left
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      width: 80, // Set the width of the image container
                      height: 80, // Set the height of the image container
                      child: Image.asset('assets/images/fire.png'),
                    ),
                    SizedBox(width: 8.0), // Space between image and column
                    // Column with two text widgets on the right
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '2 Days daily streak!',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // Make text white to stand out on gradient background
                            ),
                          ),
                          SizedBox(
                              height:
                                  8.0), // Space between the two text widgets
                          Text(
                            '4 More days to go....',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Order daily for 6 days to complete streaks, after 6th order delivery, you earn V199 in nukkad walllet which can be used to order food or buy premium',
                  textAlign: TextAlign.center,
                  style: body5TextStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    // Image on the left
                    Container(
                      width: 80, // Set the width of the image container
                      height: 80, // Set the height of the image container
                      child: Image.asset('assets/images/wallet_2.png'),
                    ),
                    SizedBox(width: 8.0), // Space between image and column
                    // Column with two text widgets on the right
                    Expanded(
                      child: Text(
                        '₹ 199 Wallet Cash',
                        style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'terms and conditions',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
