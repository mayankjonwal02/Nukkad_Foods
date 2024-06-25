import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Orders/OrderTrackingScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class OrderProcessingScreen extends StatefulWidget {
  const OrderProcessingScreen({Key? key}) : super(key: key);

  @override
  State<OrderProcessingScreen> createState() => _OrderProcessingScreenState();
}

class _OrderProcessingScreenState extends State<OrderProcessingScreen> {
  bool isOrderPlaced = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isOrderPlaced = true;
      });
      if (isOrderPlaced) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => const OrderTrackingScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isOrderPlaced
                  ? 'assets/images/order_placed.svg'
                  : 'assets/images/order_processing.svg',
              height: 20.h,
              color: primaryColor,
            ),
            SizedBox(height: 2.h),
            Text(
              isOrderPlaced ? 'Order Placed...' : 'Processing Order...',
              style: h3TextStyle.copyWith(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
