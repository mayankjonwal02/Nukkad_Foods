import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Orders/helpSupportScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Orders/orderTypeSelector.dart';
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
            child: h2Text('Orders', textBlack),
          ),
          OrderTypeSelector(onOrderTypeChanged: _handleOrderTypeChanged),
          SizedBox(height: 1.5.h),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpSupportScreen(),
                        ),
                      );
                    },
                    child:
                        bodyText1('Need help with the orders?', primaryColor2),
                  )),
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
      height: 73.h,
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
      height: 73.h,
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
