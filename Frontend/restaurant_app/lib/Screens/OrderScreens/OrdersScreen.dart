import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/customs/Order/orderStatusSelector.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  void _handleOrderTypeChanged(bool isOngoing) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderStatusSelector(onOrderStatusChanged: _handleOrderTypeChanged),
              ],
          ),
        ),
      ),
    );
  }
}
