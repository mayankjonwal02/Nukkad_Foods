import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

import '../../../Screens/Orders/trackRiderScreen.dart';

class OrderWidget extends StatefulWidget {
  final bool type;
  const OrderWidget({super.key, required this.type});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool isDeclined = false;
  bool isAccepted = false;
  bool isPrepared = false;
  bool isMarkedReady = false;

  @override
  Widget build(BuildContext context) {
    bool type = widget.type;
    return Container(
      padding: EdgeInsets.only(top: 2.h),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: textWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: textGrey2, width: 0.2.h),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ID: #47894267',
                          style: body4TextStyle.copyWith(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 0.2.h),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Status',
                            style: body4TextStyle.copyWith(
                                color: textWhite, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 35.w,
                          padding: EdgeInsets.symmetric(vertical: 0.4.h),
                          child: Text(
                            'Today, 10:40 PM',
                            style: body5TextStyle.copyWith(color: textGrey2),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: 48.w,
                          padding: EdgeInsets.symmetric(vertical: 0.4.h),
                          child: Text(
                            'By Apeksha Sharma',
                            style: body5TextStyle.copyWith(color: textGrey2),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 35.w,
                          padding: EdgeInsets.symmetric(vertical: 0.4.h),
                          child: Text(
                            'Order total : ₹202',
                            style: body5TextStyle.copyWith(
                              color: textBlack,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: colorSuccess, width: 0.2.h),
                            color: textGrey2,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 0.2.h, horizontal: 3.w),
                          child: Text(
                            'COD',
                            style: body5TextStyle.copyWith(
                                color: textBlack, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: textGrey2,
                      thickness: 0.2.h,
                    ),
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _buildOrderDetailsWidget();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              type
                  ? _buildOrderStatusWidget()
                  : GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 6.h,
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        decoration: const BoxDecoration(
                          color: textGrey1,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(9),
                            bottomRight: Radius.circular(9),
                          ),
                        ),
                        child: Text(
                          'View Reciept',
                          style: h5TextStyle.copyWith(color: textWhite),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderStatusWidget() {
    if (isDeclined == true) {
      return _buildDeclinedWidget();
    } else if (isAccepted == false &&
        isPrepared == false &&
        isMarkedReady == false) {
      return _buildPendingWidget();
    } else if (isAccepted == true &&
        isPrepared == false &&
        isMarkedReady == false) {
      return _buildPreparedWidget();
    } else if (isAccepted == true &&
        isPrepared == true &&
        isMarkedReady == false) {
      return _buildMarkReadyWidget();
    } else {
      return _buildTrackRideWidget();
    }
  }

  Widget _buildOrderDetailsWidget() {
    return SizedBox(
      width: 45.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '1 x',
            style: body4TextStyle,
          ),
          SizedBox(width: 6.w),
          Text(
            'Chicken Burger',
            style: body4TextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildDeclinedWidget() {
    return Container(
      height: 6.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: const BoxDecoration(
        color: colorFailure,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(9),
          bottomRight: Radius.circular(9),
        ),
      ),
      child: Text(
        'Declined',
        style: h5TextStyle.copyWith(color: textWhite),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPendingWidget() {
    return SizedBox(
      height: 6.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isDeclined = true;
                isAccepted = false;
                isPrepared = false;
                isMarkedReady = false;
              });
            },
            child: Container(
              height: 6.h,
              width: 44.6.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              decoration: const BoxDecoration(
                color: textGrey1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                ),
              ),
              child: Text(
                'Decline',
                style: h5TextStyle.copyWith(color: textWhite),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isDeclined = false;
                isAccepted = true;
                isPrepared = false;
                isMarkedReady = false;
              });
            },
            child: Container(
              height: 6.h,
              width: 44.5.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              decoration: const BoxDecoration(
                color: colorSuccess,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(9),
                ),
              ),
              child: Text(
                'Accept',
                style: h5TextStyle.copyWith(color: textWhite),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreparedWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDeclined = false;
          isAccepted = true;
          isPrepared = true;
          isMarkedReady = false;
        });
      },
      child: Container(
        height: 6.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(9),
            bottomRight: Radius.circular(9),
          ),
        ),
        child: Text(
          'Start Preparing',
          style: h5TextStyle.copyWith(color: textWhite),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildMarkReadyWidget() {
    return SizedBox(
      height: 6.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrackRiderScreen()));
              });
            },
            child: Container(
              height: 6.h,
              width: 44.6.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                ),
                border: Border.all(color: primaryColor, width: 0.2.h),
              ),
              child: Text(
                'Track Rider',
                style: h5TextStyle.copyWith(color: primaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isDeclined = false;
                isAccepted = true;
                isPrepared = true;
                isMarkedReady = true;
              });
            },
            child: Container(
              height: 6.h,
              width: 44.5.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(9),
                ),
              ),
              child: Text(
                'Mark Ready',
                style: h5TextStyle.copyWith(color: textWhite),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackRideWidget() {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TrackRiderScreen(),
              ),
            );
          });
        },
        child: Container(
          height: 6.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(9),
              bottomRight: Radius.circular(9),
            ),
          ),
          child: Text(
            'Track Rider',
            style: h5TextStyle.copyWith(color: textWhite),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
