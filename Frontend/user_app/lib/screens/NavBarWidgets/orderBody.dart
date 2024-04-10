import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/orderTypeSelector.dart';
import 'package:user_app/Widgets/customs/placedOrderDetails.dart';

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
    return Column(
      children: [
        Center(
          child: h2Text('Orders', textBlack),
        ),
        OrderTypeSelector(onOrderTypeChanged: _handleOrderTypeChanged),
        SizedBox(height: 1.5.h),
        _isOngoing ? ongoingOrders(_isOngoing) : previousOrders(_isOngoing),
      ],
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
            child: placedOrderDetails(isOngoing),
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
            child: placedOrderDetails(isOngoing),
          );
        },
      ),
    ),
  );
}
