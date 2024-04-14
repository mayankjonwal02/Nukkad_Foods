import 'package:flutter/material.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Orders/orderTypeSelector.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _handleOrderTypeChanged(bool isDelivery) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: Text('Shiva Chinese Wok', style: h4TextStyle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          OrderTypeSelector(onOrderTypeChanged: _handleOrderTypeChanged),
        ],
      ),
    );
  }
}
