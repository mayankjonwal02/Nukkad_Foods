// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/buttons/textIconButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Cart/billDetailWidget.dart';
import 'package:user_app/Widgets/customs/Cart/addressWidget.dart';
import 'package:user_app/Widgets/customs/Cart/couponWidget.dart';
import 'package:user_app/Widgets/customs/Orders/orderElement.dart';
import 'package:user_app/Widgets/customs/Cart/orderStateSelector.dart';
import 'package:user_app/Widgets/customs/Orders/orderTypeSelector.dart';
import 'package:user_app/Widgets/customs/Cart/savingsWidget.dart';
import 'package:user_app/Widgets/customs/Cart/totalWidget.dart';
import 'package:user_app/Widgets/customs/Cart/walletCashWidget.dart';

class CartScreen extends StatefulWidget {
  int counter;
  CartScreen({Key? key, required this.counter}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isDelivery = true;
  bool useWalletMoney = false;

  void _handleOrderTypeChanged(bool isDelivery) {
    setState(() {
      this.isDelivery = isDelivery;
    });
  }

  routeRestaurant() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: textWhite,
        surfaceTintColor: textWhite,
        backgroundColor: textWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: Text('Shiva Chinese Wok', style: h4TextStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          OrderTypeSelector(onOrderTypeChanged: _handleOrderTypeChanged),
          AddressWidget(context),
          SavingsWidget(),
          Container(
            margin:
                EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h, bottom: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: textGrey2,
                width: 0.2.h,
              ),
              color: textWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.counter,
                  itemBuilder: (context, index) {
                    return const OrderElement();
                  },
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textIconButton('Add Items', routeRestaurant),
                      const VerticalDivider(
                        color: Colors.black,
                        width: 10,
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                      ),
                      textIconButton('Cooking Request', () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          totalWidget(),
          couponWidget(),
          WalletCash(useWalletMoney, (newValue) {
            setState(() {
              useWalletMoney = newValue ?? false;
            });
          }),
          isDelivery ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: detailedBill(context),
          ) : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: OrderStateSelector(context),
          ),
        ],
      )),
    );
  }
}
