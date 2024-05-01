import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/customs/Order/orderStatusSelector.dart';
import 'package:sizer/sizer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  void _handleOrderTypeChanged(bool isOngoing) {
    setState(() {});
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
                    onOrderStatusChanged: _handleOrderTypeChanged),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
