import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/homeScreen.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:another_stepper/another_stepper.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Yay! Order Placed!",
        textStyle: h5TextStyle.copyWith(color: textBlack),
      ),
      iconWidget: Container(
        padding: EdgeInsets.all(0.5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
            width: 0.2.h,
          ),
        ),
        child: SvgPicture.asset(
          'assets/icons/order_placed_icon.svg',
          height: 3.h,
        ),
      ),
    ),
    StepperData(
      title: StepperText(
        "Order Accepted by Stall",
        textStyle: h5TextStyle.copyWith(color: textBlack),
      ),
      iconWidget: Container(
        padding: EdgeInsets.all(0.5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
            width: 0.2.h,
          ),
        ),
        child: SvgPicture.asset(
          'assets/icons/stall_icon.svg',
          height: 3.h,
          color: primaryColor,
        ),
      ),
    ),
    StepperData(
      title: StepperText(
        "Food Preparing",
        textStyle: h5TextStyle.copyWith(color: textBlack),
      ),
      iconWidget: Container(
        padding: EdgeInsets.all(0.5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
            width: 0.2.h,
          ),
        ),
        child: SvgPicture.asset(
          'assets/icons/food_preparing_icon.svg',
          height: 3.h,
          color: primaryColor,
        ),
      ),
    ),
    StepperData(
      title: StepperText(
        "Picked up by delivery partner",
        textStyle: h5TextStyle.copyWith(color: textBlack),
      ),
      iconWidget: Container(
        padding: EdgeInsets.all(0.5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
            width: 0.2.h,
          ),
        ),
        child: SvgPicture.asset(
          'assets/icons/delivering_icon.svg',
          height: 3.h,
          color: primaryColor,
        ),
      ),
    ),
    StepperData(
      title: StepperText(
        "Deliciousness delivered to you!",
        textStyle: h5TextStyle.copyWith(color: textBlack),
      ),
      iconWidget: Container(
        padding: EdgeInsets.all(0.5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
            width: 0.2.h,
          ),
        ),
        child: SvgPicture.asset(
          'assets/icons/delivered_icon.svg',
          height: 3.h,
          color: primaryColor,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: textWhite,
        shadowColor: textWhite,
        surfaceTintColor: textWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: Container(
          width: 70.w,
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
          child: Column(
            children: [
              Text(
                'Order #85765436523',
                style: h5TextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'Placed at 10:59 | Delivery by 11:25',
                style: body4TextStyle.copyWith(color: textGrey2),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 35.h,
            width: 100.w,
          ),
          Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Text(
                        'Order Details',
                        style: h5TextStyle,
                      )),
                  AnotherStepper(
                    stepperList: stepperData,
                    stepperDirection: Axis.vertical,
                    iconHeight: 5.h,
                    iconWidth: 5.h,
                    activeBarColor: primaryColor,
                    inActiveBarColor: textGrey2,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
