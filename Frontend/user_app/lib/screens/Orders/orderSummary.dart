// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sizer/sizer.dart';
// import 'package:user_app/Screens/Support/helpSupportScreen.dart';
// import 'package:user_app/Screens/Support/feedbackScreen.dart';
// import 'package:user_app/widgets/buttons/ratingButton.dart';
// import 'package:user_app/widgets/constants/colors.dart';
// import 'package:user_app/widgets/constants/texts.dart';

// class OrderSummary extends StatefulWidget {
//   final bool isOngoing;
//   const OrderSummary({Key? key, required this.isOngoing}) : super(key: key);

//   @override
//   State<OrderSummary> createState() => _OrderSummaryState();
// }

// class _OrderSummaryState extends State<OrderSummary> {
//   @override
//   Widget build(BuildContext context) {
//     bool _isOngoing = widget.isOngoing;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: textBlack),
//         ),
//         title: Text(
//           'Order Summary',
//           style: h4TextStyle,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 10.h,
//               margin: EdgeInsets.symmetric(horizontal: 5.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: 65.w,
//                         child: Text(
//                           'Shiva Chinese',
//                           style: h5TextStyle.copyWith(color: primaryColor),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       Container(
//                         height: 3.5.h,
//                         width: 25.w,
//                         decoration: BoxDecoration(
//                             color: _isOngoing ? Colors.green : textGrey2,
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               _isOngoing
//                                   ? 'assets/icons/preparing_icon.svg'
//                                   : 'assets/icons/delivered_icon.svg',
//                               height: _isOngoing ? 3.h : 2.h,
//                               color: Colors.white,
//                             ),
//                             Text(
//                               _isOngoing ? 'Preparing' : 'Delivered',
//                               style: body5TextStyle.copyWith(color: textWhite),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 100.w,
//                     child: Text(
//                       'Tilak Nagar, sanvid nagar, indore',
//                       style: body4TextStyle,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 100.w,
//                     child: Text(
//                       'Order Number #256478316641',
//                       style: body4TextStyle,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(
//               color: textGrey2,
//               thickness: 0.2.h,
//               endIndent: 5.w,
//               indent: 5.w,
//             ),
//             Container(
//               height: 25.h,
//               padding: EdgeInsets.only(
//                   top: 2.h, bottom: 3.h, right: 10.w, left: 2.w),
//               margin: EdgeInsets.only(left: 5.w, right: 5.w),
//               color: Color(0xFFf7f7f7),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Your Order',
//                     style: h5TextStyle.copyWith(color: primaryColor),
//                   ),
//                   SizedBox(height: 2.h),
//                   Text(
//                     '1 x Schezwan Noodles',
//                     style: h6TextStyle,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         '1 x ₹70',
//                         style: body4TextStyle.copyWith(color: textGrey2),
//                       ),
//                       Text(
//                         '₹ 70',
//                         style: h6TextStyle,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 2.h),
//                   Text(
//                     '2 x Fried Rice ',
//                     style: h6TextStyle,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         '2 x ₹50',
//                         style: body4TextStyle.copyWith(color: textGrey2),
//                       ),
//                       Text(
//                         '₹ 100',
//                         style: h6TextStyle,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Divider(
//               color: textGrey2,
//               thickness: 0.2.h,
//               endIndent: 5.w,
//               indent: 5.w,
//             ),
//             Container(
//               height: 9.h,
//               margin: EdgeInsets.symmetric(horizontal: 5.w),
//               padding: EdgeInsets.only(right: 10.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Taxes',
//                         style: h6TextStyle,
//                       ),
//                       Text(
//                         '₹ 7',
//                         style: h6TextStyle,
//                       ),
//                     ],
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Delivery Fee',
//                             style: h6TextStyle,
//                           ),
//                           Text(
//                             '₹ 25',
//                             style: h6TextStyle,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         'For 5.4 KM',
//                         style: body5TextStyle.copyWith(color: textGrey2),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Divider(
//               color: textGrey2,
//               thickness: 0.2.h,
//               endIndent: 5.w,
//               indent: 5.w,
//             ),
//             Container(
//               height: 6.h,
//               margin: EdgeInsets.symmetric(horizontal: 5.w),
//               padding: EdgeInsets.symmetric(horizontal: 3.w),
//               decoration: BoxDecoration(
//                 color: Color(0xFFe7ffe5),
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: colorSuccess),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Grand Total',
//                     style: h4TextStyle.copyWith(color: colorSuccess),
//                   ),
//                   Text(
//                     '₹ 202',
//                     style: h4TextStyle.copyWith(color: colorSuccess),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 2.h),
//               child: TextButton(
//                 style: ButtonStyle(
//                   overlayColor: MaterialStateProperty.all(
//                     Colors.transparent,
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const HelpSupportScreen(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Need help with the orders?',
//                   style: h6TextStyle.copyWith(color: primaryColor),
//                 ),
//               ),
//             ),
//             Container(
//               height: 21.h,
//               width: 100.w,
//               margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 3.h),
//               decoration: BoxDecoration(
//                   color: Color(0xFFf7f7f7),
//                   border: Border.all(
//                     color: textGrey2,
//                     width: 0.2.h,
//                   ),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text('Rate Your Order', style: h4TextStyle),
//                   Text(
//                     'From shiva chinese wok',
//                     style: body4TextStyle.copyWith(color: textGrey2),
//                   ),
//                   SizedBox(height: 1.h),
//                   ratingButton(),
//                   TextButton(
//                     style: ButtonStyle(
//                       overlayColor: MaterialStateProperty.all(
//                         Colors.transparent,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const FeedbackScreen(),
//                         ),
//                       );
//                     },
//                     child: Text('Tell Us More',
//                         style: h6TextStyle.copyWith(color: primaryColor)),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Support/helpSupportScreen.dart';
import 'package:user_app/Screens/Support/feedbackScreen.dart';
import 'package:user_app/widgets/buttons/ratingButton.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

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
        title: Text(
          'Order Summary',
          style: h4TextStyle,
        ),
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
                      SizedBox(
                        width: 65.w,
                        child: Text(
                          'Shiva Chinese',
                          style: h5TextStyle.copyWith(color: primaryColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: 3.5.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            color: _isOngoing ? Colors.green : textGrey2,
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
                            Text(
                              _isOngoing ? 'Preparing' : 'Delivered',
                              style: body5TextStyle.copyWith(color: textWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 90.w, // Adjusted width to prevent overflow
                    child: Text(
                      'Tilak Nagar, sanvid nagar, indore',
                      style: body4TextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 90.w, // Adjusted width to prevent overflow
                    child: Text(
                      'Order Number #256478316641',
                      style: body4TextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: textGrey2,
              thickness: 0.2.h,
              endIndent: 5.w,
              indent: 5.w,
            ),
            Container(
              height: 25.h,
              padding: EdgeInsets.only(
                  top: 2.h, bottom: 3.h, right: 10.w, left: 2.w),
              margin: EdgeInsets.only(left: 5.w, right: 5.w),
              color: Color(0xFFf7f7f7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Order',
                    style: h5TextStyle.copyWith(color: primaryColor),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '1 x Schezwan Noodles',
                    style: h6TextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1 x ₹70',
                        style: body4TextStyle.copyWith(color: textGrey2),
                      ),
                      Text(
                        '₹ 70',
                        style: h6TextStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '2 x Fried Rice ',
                    style: h6TextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '2 x ₹50',
                        style: body4TextStyle.copyWith(color: textGrey2),
                      ),
                      Text(
                        '₹ 100',
                        style: h6TextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: textGrey2,
              thickness: 0.2.h,
              endIndent: 5.w,
              indent: 5.w,
            ),
            Container(
              height: 10.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Taxes',
                        style: h6TextStyle,
                      ),
                      Text(
                        '₹ 7',
                        style: h6TextStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: h6TextStyle,
                          ),
                          Text(
                            'For 5.4 KM',
                            style: body5TextStyle.copyWith(color: textGrey2),
                          ),
                        ],
                      ),
                      Text(
                        '₹ 25',
                        style: h6TextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: textGrey2,
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
                  Text(
                    'Grand Total',
                    style: h4TextStyle.copyWith(color: colorSuccess),
                  ),
                  Text(
                    '₹ 202',
                    style: h4TextStyle.copyWith(color: colorSuccess),
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
                child: Text(
                  'Need help with the orders?',
                  style: h6TextStyle.copyWith(color: primaryColor),
                ),
              ),
            ),
            Container(
              height: 21.h,
              width: 90.w, // Adjusted width to prevent overflow
              margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 3.h),
              decoration: BoxDecoration(
                  color: Color(0xFFf7f7f7),
                  border: Border.all(
                    color: textGrey2,
                    width: 0.2.h,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Rate Your Order', style: h4TextStyle),
                  Text(
                    'From shiva chinese wok',
                    style: body4TextStyle.copyWith(color: textGrey2),
                  ),
                  SizedBox(height: 1.h),
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
                    child: Text('Tell Us More',
                        style: h6TextStyle.copyWith(color: primaryColor)),
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
