import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Support/helpSupportScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Orders/orderStatusSelector.dart';
import 'package:user_app/Widgets/customs/Orders/placedOrderDetails.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  bool _isOngoing = true;

  void _handleOrderTypeChanged(bool isOngoing) {
    setState(() {
      _isOngoing = isOngoing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Column(
        children: [
          Center(
            child: Text(
              'Orders',
              style: h1TextStyle,
            ),
          ),
          OrderStatusSelector(onOrderStatusChanged: _handleOrderTypeChanged),
          SizedBox(height: 2.h),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: _isOngoing
                    ? ongoingOrders(_isOngoing)
                    : previousOrders(_isOngoing),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  color: Colors.white,
                  child: Center(
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpSupportScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Need help with the orders?',
                        style: body4TextStyle.copyWith(color: primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget previousOrders(isOngoing) {
  return SingleChildScrollView(
    child: SizedBox(
      height: 71.5.h,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: placedOrderDetails(isOngoing, context),
          );
        },
      ),
    ),
  );
}

Widget ongoingOrders(isOngoing) {
  return SingleChildScrollView(
    child: SizedBox(
      height: 71.5.h,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: placedOrderDetails(isOngoing, context),
          );
        },
      ),
    ),
  );
}
