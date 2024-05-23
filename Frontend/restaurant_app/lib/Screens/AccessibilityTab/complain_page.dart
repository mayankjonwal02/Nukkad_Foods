import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/Screens/AccessibilityTab/complainsFilter.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

class ComplaintsWidget extends StatefulWidget {
  const ComplaintsWidget({super.key});

  @override
  State<ComplaintsWidget> createState() => _ComplaintsWidgetState();
}

class _ComplaintsWidgetState extends State<ComplaintsWidget> {
  List<Map<String, dynamic>> dataList = [];
  bool isOngoing = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints', style: h4TextStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 19.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: ComplaintFilter(
                      type: isOngoing, selected: _handelSelectedTab),
                ),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2.h, color: primaryColor),
                    color: primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order no. #435634624',
                        style: body6TextStyle.copyWith(
                            color: textBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wrong item delivered',
                            style: body4TextStyle.copyWith(
                                color: colorFailure,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 1.h),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.2.h, color: primaryColor),
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            child: Text(
                              'New',
                              style: body6TextStyle.copyWith(
                                  color: textWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(width: 0.2.h, color: textGrey3)),
                    color: textWhite,
                    // borderRadius: BorderRadius.only(bott),
                    boxShadow: [
                      BoxShadow(
                        color: textGrey3.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset:
                            Offset(0, 3), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 65.w,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      // _image != null
                                      //     ? FileImage(_image!) as ImageProvider<Object>?
                                      //     :
                                      AssetImage('assets/images/owner.png'),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        maxLines: 1,
                                        'Manish Sharma',
                                        style: body4TextStyle.copyWith(
                                            color: textBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        '330, sampat greens, kanadiya, indore',
                                        style: body6TextStyle.copyWith(
                                            color: textGrey3,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            maxLines: 1,
                            '11:30 PM',
                            style: body4TextStyle.copyWith(
                                color: textGrey1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Divider(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wrong items',
                            style: body4TextStyle.copyWith(
                                color: primaryColor,
                                fontSize: 15,
                                letterSpacing: 0.7,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                            ),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.2.h, color: colorSuccess),
                              color: colorSuccess,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              boxShadow: [
                                BoxShadow(
                                  color: textGrey3
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: Offset(
                                      0, 3), // Offset in the x and y directions
                                ),
                              ],
                            ),
                            child: Text(
                              'Verified',
                              style: body5TextStyle.copyWith(
                                  color: textWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '1 x Chicken Noodles ',
                        style: body6TextStyle.copyWith(
                            color: textBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1 x ₹70',
                            style: body6TextStyle.copyWith(
                                color: textGrey2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            ' ₹ 70',
                            style: body6TextStyle.copyWith(
                                color: textBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.network(
                            'https://example.com/your-image-url.jpg', // Replace with your image URL
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 2.h),
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 0.7.h),
                        decoration: BoxDecoration(
                          color: colorwarnig.withOpacity(0.3),
                          border: Border.all(width: 0.2.h, color: colorwarnig2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Review:',
                                style: body3TextStyle.copyWith(
                                  fontSize: 14,
                                  color: colorFailure,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' “Ordered for chicken noodles. instead recieves veg. noodles. kindly refund”',
                                style: body6TextStyle.copyWith(
                                  letterSpacing: 0.7,
                                  fontSize: 12,
                                  color: textBlack,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Align(
                          child: Text(
                            'Refund amount requested: ₹70',
                            style: body5TextStyle.copyWith(
                                color: primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 45.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        // color: colorwarnig.withOpacity(0.3),
                        border: Border.all(width: 0.2.h, color: textGrey1),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(7)),
                      ),
                      child: Text(
                        'Decline',
                        textAlign: TextAlign.center,
                        style: body3TextStyle.copyWith(
                          fontSize: 16,
                          color: textGrey1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: 45.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: colorSuccess,
                        border: Border.all(width: 0.2.h, color: colorSuccess),
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(7)),
                      ),
                      child: Text(
                        'Approve',
                        textAlign: TextAlign.center,
                        style: body4TextStyle.copyWith(
                          fontSize: 16,
                          color: textWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void routerChat() {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const ChatScreenWidget(),
    //   ),
    // );
  }

  void _handelSelectedTab(int idx) {
    // switch (idx) {
    //   case 0:
    //     setState(() {
    //       myOrder = responseDataList
    //           .where((order) =>
    //               order['status'] == 'Pending' ||
    //               order['status'] == 'Canceled' ||
    //               order['status'] == 'Accepted' ||
    //               order['status'] == 'On the way' ||
    //               order['status'] == 'Ready')
    //           .toList();
    //     });
    //   case 1:
    //     setState(() {
    //       myOrder = responseDataList
    //           .where((order) => order['status'] == 'Pending')
    //           .toList();
    //     });
    //     break;
    //   case 2:
    //     setState(() {
    //       myOrder = responseDataList
    //           .where((order) => order['status'] == 'Accepted')
    //           .toList();
    //     });
    //     break;
    //   case 3:
    //     setState(() {
    //       myOrder = responseDataList
    //           .where((order) => order['status'] == 'Ready')
    //           .toList();
    //     });
    //     break;
    //   case 4:
    //     setState(() {
    //       myOrder = responseDataList
    //           .where((order) => order['status'] == 'On the way')
    //           .toList();
    //     });
    //     break;
    //   default:
    //     setState(() {
    //       myOrder = responseDataList
    //           .where((order) =>
    //               order['status'] == 'Pending' ||
    //               order['status'] == 'Canceled' ||
    //               order['status'] == 'Accepted' ||
    //               order['status'] == 'On the way' ||
    //               order['status'] == 'Ready')
    //           .toList();
    //     });
    //     break;
    // }
  }
}
