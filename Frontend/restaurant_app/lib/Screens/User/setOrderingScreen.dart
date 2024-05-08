import 'package:flutter/material.dart';
import 'package:restaurant_app/Screens/User/documentationScreen.dart';
import 'package:restaurant_app/Screens/User/registrationCompleteScreen.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/customs/User/registrationTimeline.dart';
import 'package:restaurant_app/Widgets/customs/User/uploadWidget.dart';
import 'package:restaurant_app/Widgets/input_fields/textInputField.dart';
import 'package:sizer/sizer.dart';

class SetOrderingScreen extends StatefulWidget {
  const SetOrderingScreen({super.key});

  @override
  State<SetOrderingScreen> createState() => _SetOrderingScreenState();
}

class _SetOrderingScreenState extends State<SetOrderingScreen> {
  TextEditingController controller = TextEditingController();

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<bool> isOpen = List.generate(7, (index) => false);

  routeRegistrationComplete() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RegistrationCompleteScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DocumentationScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
        title: Text('Set for Ordering', style: h4TextStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegistrationTimeline(pageIndex: 3),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 2.h),
                child: Text(
                  'Cuisines'.toUpperCase(),
                  style: titleTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 3.w, right: 3.w),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: textGrey2, width: 0.2.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: textInputField(
                          'Cuisines', controller, (String input) => null),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Text(
                  'restaurant operational hours'.toUpperCase(),
                  style: titleTextStyle.copyWith(fontSize: 14.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: textGrey2, width: 0.2.w),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select restaurant opening days',
                      style: body4TextStyle.copyWith(color: textGrey3),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 100.w,
                      child: Wrap(
                        spacing: 0.5.h,
                        runSpacing: 0.5.h,
                        alignment: WrapAlignment.spaceEvenly,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: List.generate(
                          (daysOfWeek.length / 2).ceil(),
                          (rowIndex) {
                            int startIndex = rowIndex * 2;
                            int endIndex = startIndex + 1;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (startIndex < daysOfWeek.length)
                                  Checkbox(
                                    value: isOpen[startIndex],
                                    onChanged: (newValue) {
                                      setState(() {
                                        isOpen[startIndex] = newValue!;
                                      });
                                    },
                                    activeColor: colorSuccess,
                                  ),
                                if (startIndex < daysOfWeek.length)
                                  Text(
                                    daysOfWeek[startIndex],
                                    style: body3TextStyle.copyWith(
                                        fontSize: 12.sp),
                                  ),
                                if (endIndex < daysOfWeek.length)
                                  Checkbox(
                                    value: isOpen[endIndex],
                                    onChanged: (newValue) {
                                      setState(() {
                                        isOpen[endIndex] = newValue!;
                                      });
                                    },
                                    activeColor: colorSuccess,
                                  ),
                                if (endIndex < daysOfWeek.length)
                                  Text(
                                    daysOfWeek[endIndex],
                                    style: body3TextStyle.copyWith(
                                        fontSize: 12.sp),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select restaurant opening /closing time',
                      style: body4TextStyle.copyWith(color: textGrey3),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Text(
                  'add restaurant menu images'.toUpperCase(),
                  style: titleTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: textGrey2, width: 0.2.w),
              ),
              child: Column(
                children: [uploadWidget()],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Text(
                  'add restaurant images'.toUpperCase(),
                  style: titleTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: textGrey2, width: 0.2.w),
              ),
              child: Column(
                children: [uploadWidget()],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Text(
                  'add food images'.toUpperCase(),
                  style: titleTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: textGrey2, width: 0.2.w),
              ),
              child: Column(
                children: [uploadWidget()],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: mainButton(
                'Set Restaurant',
                textWhite,
                routeRegistrationComplete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
