import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/Screens/UserScreens/ownerDetailsScreen.dart';
import 'package:restaurant_app/Screens/UserScreens/setOrderingScreen.dart';
import 'package:restaurant_app/Widgets/buttons/mainButton.dart';
import 'package:restaurant_app/Widgets/constants/colors.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/customs/User/registrationTimeline.dart';
import 'package:restaurant_app/Widgets/customs/User/uploadWidget.dart';
import 'package:restaurant_app/Widgets/input_fields/textInputField.dart';
import 'package:restaurant_app/Widgets/noteWidget.dart';
import 'package:sizer/sizer.dart';

class DocumentationScreen extends StatefulWidget {
  const DocumentationScreen({super.key});

  @override
  State<DocumentationScreen> createState() => _DocumentationScreenState();
}

class _DocumentationScreenState extends State<DocumentationScreen> {
  String gstinNumber = '';
  String fssaiNumber = '';
  String fssaiExpiryDate = '';
  final gstController = TextEditingController();
  final fssaiController = TextEditingController();

  final bool _isGSTUploaded = false;
  final bool _isFSSAIUploaded = false;

  routeOrdering() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SetOrderingScreen()));
  }

  @override
  void dispose() {
    gstController.dispose();
    fssaiController.dispose();
    super.dispose();
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
                builder: (context) => const OwnerDetailsScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
        title: Text('Documentation', style: h4TextStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegistrationTimeline(pageIndex: 2),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 2.h),
                child: Text('GST Details'.toUpperCase(), style: titleTextStyle),
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
                  textInputField('GSTIN Number', gstController, (String input) {
                    setState(() {
                      gstinNumber = input;
                    });
                  }),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                    child: Text(
                      'Upload GST Certificate',
                      style: h6TextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  uploadWidget(),
                  _isGSTUploaded
                      ? Text(
                          'img123.jpg selected!',
                          style: body4TextStyle.copyWith(color: colorSuccess),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child:
                    Text('FSSAI License'.toUpperCase(), style: titleTextStyle),
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
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: textInputField(
                        'FSSAI Certificate Number', fssaiController,
                        (String input) {
                      setState(() {
                        fssaiNumber = input;
                      });
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: textInputField(
                        'FSSAI Certificate Expiry Date', fssaiController,
                        (String input) {
                      setState(() {
                        fssaiExpiryDate = input;
                      });
                    }),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                    child: Text(
                      'Upload FSSAI Certificate',
                      style: h6TextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  uploadWidget(),
                  _isFSSAIUploaded
                      ? Text(
                          'img123.jpg selected!',
                          style: body4TextStyle.copyWith(color: colorSuccess),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: noteWidget(
                        'As per government guidelines, you can not operate food business without FSSAI License.'),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                child: mainButton('Proceed', textWhite, routeOrdering))
          ],
        ),
      ),
    );
  }
}