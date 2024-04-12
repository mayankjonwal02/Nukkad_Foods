import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class FoodItemWidget extends StatefulWidget {
  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      margin: EdgeInsets.only(top: 1.h, left: 1.w, right: 1.w, bottom: 1.h),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 15.h,
          width: 72.w,
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.2.h,
              color: textGrey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/icons/veg_icon.png', height: 4.h),
              SizedBox(width: 2.w),
              SizedBox(
                width: 30.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bodyText1('Veg Manchurian Gravy', textBlack),
                    bodyText1('₹ 200', textBlack),
                  ],
                ),
              ),
              SizedBox(
                width: 30.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/bowl.png', height: 9.h),
                    Container(
                      height: 3.h,
                      width: 15.w,
                      padding: EdgeInsets.symmetric(vertical: 0.2.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2.h,
                          color: primaryColor2,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: _counter > 0
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: _decrementCounter,
                                  child: Icon(Icons.remove, color: primaryColor2, size: 14.sp),
                                ),
                                Text(
                                  '$_counter',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryColor2,
                                    fontFamily: 'Poppins',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _incrementCounter,
                                  child: Icon(Icons.add, color: primaryColor2, size: 14.sp),
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: _incrementCounter,
                              child: Text(
                                'Add +',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryColor2,
                                  fontFamily: 'Poppins',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
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
  }
}
