import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/customs/OrderBody/sortingBar.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/customs/OrderBody/orderFilters.dart';
import '../../Widgets/customs/OrderBody/orderStatusSelector.dart';
import '../../Widgets/customs/OrderBody/orderWidget.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: OrderFilter(type: isOngoing),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 2.h),
                child: SizedBox(
                  height: 70.h,
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return OrderWidget(type: isOngoing);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
