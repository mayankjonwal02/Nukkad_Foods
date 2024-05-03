import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/customs/OrderBody/sortingBar.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/customs/OrderBody/orderStatusSelector.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  bool isOngoing = true;

  void _handleOrderTypeChanged(bool newValue) {
    setState(() {
      isOngoing = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: OrderStatusSelector(
                  onOrderStatusChanged: _handleOrderTypeChanged,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SortingBar(type: isOngoing),
              )
            ],
          ),
        ),
      ),
    );
  }
}
