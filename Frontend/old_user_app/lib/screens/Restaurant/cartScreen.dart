// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/buttons/textIconButton.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Cart/addressWidget.dart';
import 'package:user_app/Widgets/customs/Cart/billDetailWidget.dart';
import 'package:user_app/Widgets/customs/Cart/couponWidget.dart';
import 'package:user_app/Widgets/customs/Cart/orderStateSelector.dart';
import 'package:user_app/Widgets/customs/Cart/savingsWidget.dart';
import 'package:user_app/Widgets/customs/Cart/totalWidget.dart';
import 'package:user_app/Widgets/customs/Cart/walletCashWidget.dart';
import 'package:user_app/Widgets/customs/Orders/orderElement.dart';
import 'package:user_app/Widgets/customs/Orders/orderTypeSelector.dart';
import 'package:user_app/Widgets/customs/noteWidget.dart';
import 'package:user_app/Widgets/input_fields/textInputField.dart';
import 'package:user_app/widgets/constants/colors.dart';

class CartScreen extends StatefulWidget {
  int counter;
  CartScreen({Key? key, required this.counter}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isDelivery = true;
  bool useWalletMoney = false;
  String cookingRequest = '';
  final cookingRequestController = TextEditingController();

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
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          textIconButton('Add Items', routeRestaurant),
                          VerticalDivider(
                            color: textGrey2,
                            thickness: 0.5.w,
                          ),
                          textIconButton(
                              'Cooking Request', cookingRequestDialog),
                        ],
                      ),
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
            isDelivery
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: detailedBill(context),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: OrderStateSelector(
                context: context,
                selectedDate: selectedDate,
                selectedTime: selectedTime,
                onDateSelected: (DateTime newDate) {
                  setState(() {
                    selectedDate = newDate;
                  });
                },
                onTimeSelected: (TimeOfDay newTime) {
                  setState(() {
                    selectedTime = newTime;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cookingRequestDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SingleChildScrollView(
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: const Color(0xfff7f7f7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: textGrey2,
                    width: 0.2.h,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      child: Text(
                        'Special cooking requests',
                        style: h3TextStyle.copyWith(color: primaryColor),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                      child: textInputField(
                          'Add Cooking Requests', cookingRequestController,
                          (String input) {
                        setState(() {
                          cookingRequest = input;
                        });
                      }),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                      child: noteWidget(
                          'We will try our best to inculcate your requests. However, no refund request in this context will be possible.'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: primaryColor,
                                  width: 0.2.h,
                                ),
                                color: textWhite,
                              ),
                              child: Text(
                                'Cancel',
                                style: body2TextStyle.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: primaryColor,
                                  width: 0.2.h,
                                ),
                                color: primaryColor,
                              ),
                              child: Text(
                                'Save',
                                style: body2TextStyle.copyWith(
                                    color: textWhite,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
