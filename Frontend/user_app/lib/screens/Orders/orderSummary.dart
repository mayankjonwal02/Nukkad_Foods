import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Support/helpSupportScreen.dart';
import 'package:user_app/Screens/Support/feedbackScreen.dart';
import 'package:user_app/Widgets/buttons/ratingButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class OrderSummary extends StatefulWidget {
  final bool isOngoing;
  const OrderSummary({Key? key, required this.isOngoing}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    bool _isOngoing = widget.isOngoing;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: h4Text('Order Summary', textBlack),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 10.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      h5Text('Shiva Chinese', primaryColor2),
                      Container(
                        height: 3.5.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            color: _isOngoing ? Colors.green : textGrey,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              _isOngoing
                                  ? 'assets/icons/preparing_icon.svg'
                                  : 'assets/icons/delivered_icon.svg',
                              height: _isOngoing ? 3.h : 2.h,
                              color: Colors.white,
                            ),
                            bodyText2(_isOngoing ? 'Preparing' : 'Delivered',
                                Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bodyText1('Tilak Nagar, sanvid nagar, indore', textBlack),
                  bodyText1('Order Number #256478316641', textBlack)
                ],
              ),
            ),
            Divider(
              color: textGrey,
              thickness: 0.2.h,
              endIndent: 5.w,
              indent: 5.w,
            ),
            Container(
              //TODO : make this container resizable based on number of items
              height: 25.h,
              padding: EdgeInsets.only(
                  top: 3.h, bottom: 3.h, right: 10.w, left: 2.w),
              margin: EdgeInsets.only(left: 5.w, right: 5.w),
              color: Color(0xFFf7f7f7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h5Text('Your Order', primaryColor2),
                  SizedBox(height: 2.h),
                  h6Text('1 x Schezwan Noodles', textBlack),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      bodyText1('1 x ₹70', textGrey),
                      h6Text('₹ 70', textBlack),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  h6Text('2 x Fried Rice ', textBlack),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      bodyText1('2 x ₹50', textGrey),
                      h6Text('₹ 100', textBlack),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: textGrey,
              thickness: 0.2.h,
              endIndent: 5.w,
              indent: 5.w,
            ),
            Container(
              height: 9.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      h6Text('Taxes', textBlack),
                      h6Text('₹ 7', textBlack),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          h6Text('Delivery Fee', textBlack),
                          h6Text('₹ 25', textBlack),
                        ],
                      ),
                      bodyText1('For 5.4 KM', textLightGrey)
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: textGrey,
              thickness: 0.2.h,
              endIndent: 5.w,
              indent: 5.w,
            ),
            Container(
              height: 6.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                color: Color(0xFFe7ffe5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorSuccess),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  h4Text('Grand Total', colorSuccess),
                  h4Text('₹ 202', colorSuccess),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                color: Color(0xFFf7f7f7),
                border: Border(
                  top: BorderSide(
                    color: textGrey,
                    width: 0.2.h,
                  ),
                  bottom: BorderSide(
                    color: textGrey,
                    width: 0.2.h,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/coin_icon.svg', height: 4.h),
                  SizedBox(width: 2.w),
                  Text(
                    'Yay! you earned 8 coins for this order!',
                    style: TextStyle(
                      color: colorSuccess,
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpSupportScreen(),
                    ),
                  );
                },
                child: bodyText1('Need help with the orders?', primaryColor2),
              ),
            ),
            Container(
              height: 21.h,
              width: 100.w,
              margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 3.h),
              decoration: BoxDecoration(
                  color: Color(0xFFf7f7f7),
                  border: Border.all(
                    color: textGrey,
                    width: 0.2.h,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  h4Text('Rate Your Order', textBlack),
                  bodyText1('From shiva chinese wok', textGrey),
                  ratingButton(),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeedbackScreen(),
                        ),
                      );
                    },
                    child: h5Text('Tell Us More', primaryColor2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
