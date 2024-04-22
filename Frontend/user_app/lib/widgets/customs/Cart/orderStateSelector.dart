import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Orders/orderProcessingScreen.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

class OrderStateSelector extends StatelessWidget {
  final BuildContext context;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final void Function(DateTime) onDateSelected;
  final void Function(TimeOfDay) onTimeSelected;

  const OrderStateSelector({
    Key? key,
    required this.context,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateSelected,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _showScheduleOrderDialog(context, selectedDate, selectedTime);
          },
          child: Container(
            width: 47.w,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: primaryColor,
                width: 0.2.h,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/schedule_order_icon.svg',
                  height: 3.h,
                  color: primaryColor,
                ),
                SizedBox(width: 1.w),
                Text(
                  'Schedule Order',
                  style: h5TextStyle.copyWith(
                      color: primaryColor, fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderProcessingScreen(),
              ),
            );
          },
          child: Container(
            width: 40.w,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: primaryColor,
                width: 0.2.h,
              ),
              color: primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Order Now',
                  style:
                      h5TextStyle.copyWith(color: textWhite, fontSize: 13.sp),
                ),
                SizedBox(width: 2.w),
                SvgPicture.asset(
                  'assets/icons/order_now_icon.svg',
                  height: 2.h,
                  color: textWhite,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showScheduleOrderDialog(
    BuildContext context,
    DateTime date,
    TimeOfDay time,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xfff7f7f7),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    margin: EdgeInsets.only(top: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFf7f7f7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: textGrey2,
                        width: 0.2.h,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Select Date',
                              style: h4TextStyle,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _selectDate(context, date);
                              },
                              child: const Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            date.toString().split(' ')[0],
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFf7f7f7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: textGrey2,
                        width: 0.2.h,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Select Time',
                              style: h4TextStyle,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                            GestureDetector(
                              onTap: () {
                                _selectTime(context, date, time);
                              },
                              child: Icon(Icons.access_time),
                            )
                          ],
                        ),
                        Center(
                          child: Text(
                            time.format(context),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(width: 1.w),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: textWhite,
                            border: Border.all(
                              color: primaryColor,
                              width: 0.2.h,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Cancel',
                            style: h5TextStyle.copyWith(color: primaryColor),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const OrderProcessingScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            border: Border.all(
                              color: primaryColor,
                              width: 0.2.h,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Confirm',
                            style: h5TextStyle.copyWith(color: textWhite),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime date) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      selectableDayPredicate: (DateTime date) {
        return date.isAfter(DateTime.now().subtract(const Duration(days: 1)));
      },
    );
    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  Future<void> _selectTime(
      BuildContext context, DateTime date, TimeOfDay selectedTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
      helpText: 'Select Time',
      cancelText: 'Cancel',
      confirmText: 'Confirm',
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (pickedTime != null) {
      onTimeSelected(pickedTime);
    }
  }
}
