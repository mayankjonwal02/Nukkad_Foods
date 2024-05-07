import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/constants/texts.dart';

class viewEarningScreen extends StatefulWidget {
  const viewEarningScreen({super.key});

  @override
  State<viewEarningScreen> createState() => _viewEarningScreenState();
}

class _viewEarningScreenState extends State<viewEarningScreen> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earnings', style: h4TextStyle),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 3.h),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
                    decoration: BoxDecoration(
                      color: textBlack,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: textWhite,
                          size: 25.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          selectedDate != null
                              ? DateFormat('E, dd/MM/yyyy')
                                  .format(selectedDate!)
                              : 'Select Date',
                          style: body3TextStyle.copyWith(color: textWhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: BoxDecoration(
                  color: textWhite,
                  border: Border.all(color: textGrey2, width: 0.2.h),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return earningsWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget earningsWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: textGrey2, width: 0.1.h),
        )),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Placer\'s Name',
                    style: body3TextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.1.h, horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Status',
                      style: body4TextStyle.copyWith(
                        color: textWhite,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/timer_icon.svg'),
                      SizedBox(width: 2.w),
                      Text(
                        '11:11 AM',
                        style: body4TextStyle.copyWith(color: textGrey2),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/route_icon.svg'),
                      SizedBox(width: 2.w),
                      Text(
                        '4.5 KM',
                        style: body4TextStyle.copyWith(color: textGrey2),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '₹ 235',
                  style: h5TextStyle,
                ),
              ],
            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
