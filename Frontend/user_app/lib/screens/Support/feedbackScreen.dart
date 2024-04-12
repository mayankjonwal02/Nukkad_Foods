import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/NavBarWidgets/orderBody.dart';
import 'package:user_app/Widgets/buttons/mainButton.dart';
import 'package:user_app/Widgets/buttons/ratingButton.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final textstyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: textBlack,
  );

  List<bool> isSelected = [false, false, false, false, false];
  List<String> overallParams = [
    'Taste',
    'Quality',
    'Quantity',
    'Price',
    'Delivery'
  ];

  // Initialize a list of boolean flags for each container
  List<bool> isTogglesVisible = [false, false, false];

  Widget rating() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: RatingBar.builder(
        initialRating: 0.0,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        glow: false,
        itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
        itemSize: 4.h,
        updateOnDrag: true,
        itemBuilder: (context, _) => SvgPicture.asset(
          'assets/icons/star_icon.svg',
          color: const Color(0xffFFC000),
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }

  void toggleSelection(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  // Function to toggle the visibility of a specific toggles widget
  void toggleTogglesVisibility(int index) {
    setState(() {
      isTogglesVisible[index] = !isTogglesVisible[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
        ),
        title: h4Text('Feedback and Reviews', textBlack),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => toggleTogglesVisibility(0),
              child: Container(
                height: 20.h,
                width: 100.w,
                margin: EdgeInsets.only(
                    top: 3.h, left: 5.w, right: 5.w, bottom: 1.5.h),
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
                    h4Text('Overall Experience', textBlack),
                    bodyText1('From shiva chinese wok', textGrey),
                    ratingButton(),
                  ],
                ),
              ),
            ),
            if (isTogglesVisible[0])
              toggles(overallParams, isSelected, toggleSelection),
            GestureDetector(
              onTap: () => toggleTogglesVisibility(1),
              child: Container(
                height: 35.h,
                width: 100.w,
                margin: EdgeInsets.only(
                    top: 1.5.h, left: 5.w, right: 5.w, bottom: 1.5.h),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        h4Text('Rate Dishes', textBlack),
                        SizedBox(width: 2.w),
                        SvgPicture.asset(
                          'assets/icons/dishes_icon.svg',
                          height: 4.h,
                        )
                      ],
                    ),
                    bodyText1('From shiva chinese wok', textGrey),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Schezwan Noodles', style: textstyle),
                          rating(),
                          Divider(
                            color: textGrey,
                            thickness: 0.2.h,
                          ),
                          Text('Fried Rice', style: textstyle),
                          rating(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isTogglesVisible[1])
              toggles(overallParams, isSelected, toggleSelection),
            GestureDetector(
              onTap: () => toggleTogglesVisibility(2),
              child: Container(
                height: 35.h,
                width: 100.w,
                margin: EdgeInsets.only(
                    top: 1.5.h, left: 5.w, right: 5.w, bottom: 3.h),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        h4Text('Rate Delivery', textBlack),
                        SizedBox(width: 2.w),
                        SvgPicture.asset(
                          'assets/icons/delivering_icon.svg',
                          height: 4.h,
                        )
                      ],
                    ),
                    bodyText1('From shiva chinese wok', textGrey),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivery time', style: textstyle),
                          rating(),
                          Divider(
                            color: textGrey,
                            thickness: 0.2.h,
                          ),
                          Text('Delivery Partner behavior ', style: textstyle),
                          rating(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isTogglesVisible[2])
              toggles(overallParams, isSelected, toggleSelection),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: mainButton(
                'Submit Feedback',
                Colors.white,
                () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrdersBody(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget toggles(
    List<String> namesList, List<bool> isSelected, Function(int) onTap) {
  return Container(
    height: 15.h,
    width: 100.w,
    padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
    decoration: BoxDecoration(
      color: Color(0xFFe7ffe5),
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
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'WHAT IMPRESSED YOU?'.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          height: 6.h,
          margin: EdgeInsets.symmetric(vertical: 2.h),
          child: ListView.builder(
            itemCount: namesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onTap(index);
                },
                child: Container(
                  width: 25.w,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: isSelected[index] ? primaryColor2 : Colors.white,
                    border: Border.all(
                      color: primaryColor2,
                      width: 0.2.h,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: h5Text(
                      namesList[index],
                      isSelected[index] ? Colors.white : textBlack,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
