import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Controller/order/orders_model.dart';
import 'package:user_app/Screens/Support/feedbackScreen.dart';
import 'package:user_app/Screens/Support/helpSupportScreen.dart';
import 'package:user_app/widgets/buttons/ratingButton.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

class OrderSummary extends StatefulWidget {
  final bool isOngoing;
  final Orders order;
  const OrderSummary({
    Key? key,
    required this.isOngoing,
    required this.order,
  }) : super(key: key);

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
                    width: 90.w,
                    child: Text(
                      'Tilak Nagar, sanvid nagar, indore',
                      style: body4TextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      'Order Number #${widget.order.orderId ?? 0}',
                      style: body4TextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            _buildDividerWidget(),
            _buildOrderWidget(),
            _buildDividerWidget(),
            _buildTotalCostWidget(),
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
            _buildRateOrderWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderWidget() => Card(
        surfaceTintColor: Color(0xFFf7f7f7),
        color: Color(0xFFf7f7f7),
        elevation: 0,
        child: Column(
          children: [
            Container(
              // height: 25.h,
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
                  widget.order.items!.length != 0
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemCount: widget.order.items!.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildCustomTextWidget(
                                        text:
                                            '${widget.order.items![index].itemQuantity} x ${widget.order.items![index].itemName}',
                                      ),
                                      _buildCustomTextWidget(
                                        text:
                                            '1 x ₹${widget.order.items![index].unitCost}',
                                        style: body4TextStyle.copyWith(
                                            color: textGrey2),
                                      ),
                                    ]),
                              ),
                              _buildCustomTextWidget(
                                  flex: 0,
                                  text:
                                      '₹ ${widget.order.items![index].itemQuantity != null && widget.order.items![index].unitCost != null ? (widget.order.items![index].itemQuantity! * widget.order.items![index].unitCost!) : "0.0"}'),
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 2.h,
                          ),
                        )
                      : SizedBox.shrink(),
                  // Text(
                  //   '1 x Schezwan Noodles',
                  //   style: h6TextStyle,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       '1 x ₹70',
                  //       style: body4TextStyle.copyWith(color: textGrey2),
                  //     ),
                  //     Text(
                  //       '₹ 70',
                  //       style: h6TextStyle,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 2.h),
                  // Text(
                  //   '2 x Fried Rice ',
                  //   style: h6TextStyle,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       '2 x ₹50',
                  //       style: body4TextStyle.copyWith(color: textGrey2),
                  //     ),
                  //     Text(
                  //       '₹ 100',
                  //       style: h6TextStyle,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            _buildDividerWidget(),
            Container(
              // height: 10.h,
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
                      Expanded(child: _buildCustomTextWidget(text: 'Taxes')),
                      // Text(
                      //   'Taxes',
                      //   style: h6TextStyle,
                      // ),
                      _buildCustomTextWidget(
                          flex: 0,
                          text:
                              '₹ ${widget.order.gst != null && widget.order.convinenceFee != null ? (widget.order.gst! + widget.order.convinenceFee!) ?? 0.0 : 0.0}'),
                      // Text(
                      //   '₹ 7',
                      //   style: h6TextStyle,
                      // ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCustomTextWidget(text: 'Delivery Fee'),
                            // Text(
                            //   'Delivery Fee',
                            //   style: h6TextStyle,
                            // ),
                            _buildCustomTextWidget(
                                text: 'For 5.4 KM',
                                style:
                                    body5TextStyle.copyWith(color: textGrey2)),
                            // Text(
                            //   'For 5.4 KM',
                            //   style: body5TextStyle.copyWith(color: textGrey2),
                            // ),
                          ],
                        ),
                      ),
                      _buildCustomTextWidget(
                          flex: 0,
                          text: '₹ ${widget.order.deliveryCharge ?? 0.0}'),
                      // Text(
                      //   '₹ ${widget.order.deliveryCharge ?? 0.0}',
                      //   style: h6TextStyle,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildTotalCostWidget() => Container(
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
              '₹ ${widget.order.totalCost ?? 0.0}',
              style: h4TextStyle.copyWith(color: colorSuccess),
            ),
          ],
        ),
      );

  Widget _buildRateOrderWidget() => Container(
        // height: 21.h,
        width: 90.w,
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
      );

  Widget _buildDividerWidget() => Divider(
        color: textGrey2,
        thickness: 0.2.h,
        endIndent: 5.w,
        indent: 5.w,
      );

  Widget _buildCustomTextWidget({
    required String text,
    TextStyle? style,
    int? flex,
  }) =>
      Row(
        children: [
          Expanded(
            flex: flex ?? 1,
            child: Text(
              text,
              style: style ?? h6TextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
}
