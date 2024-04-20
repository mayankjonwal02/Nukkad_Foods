import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class OrderElement extends StatefulWidget {
  const OrderElement({super.key});

  @override
  State<OrderElement> createState() => _OrderElementState();
}

class _OrderElementState extends State<OrderElement> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/veg_icon.png',
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              width: 45.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schezwan Noodles',
                    style: body4TextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '₹ 70',
                    style: body4TextStyle.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
              child: Text(
                '₹ 70',
                style: body4TextStyle.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 20.w,
              margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              padding: EdgeInsets.symmetric(vertical: 0.3.h, horizontal: 1.w),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.2.h,
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _decrementCounter,
                    child: Icon(Icons.remove, color: primaryColor, size: 12.sp),
                  ),
                  Text(
                    '$_counter',
                    textAlign: TextAlign.center,
                    style: body3TextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: _incrementCounter,
                    child: Icon(Icons.add, color: primaryColor, size: 12.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 0.2.h,
          color: textGrey2,
          indent: 2.w,
          endIndent: 2.w,
        ),
      ],
    );
  }
}
