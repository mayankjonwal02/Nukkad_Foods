import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Wallet/coinsWidget.dart';
import 'package:user_app/Widgets/customs/Wallet/convertCoins.dart';
import 'package:user_app/Widgets/customs/Wallet/couponButton.dart';
import 'package:user_app/Widgets/customs/Wallet/header.dart';
import 'package:user_app/Widgets/customs/Wallet/referalMap.dart';
import 'package:user_app/Widgets/customs/Wallet/referalNotification.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({super.key});

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          walletHeader(),
          SizedBox(height: 4.h),
          coinsWidget(),
          SizedBox(height: 1.h),
          convertTextButton(),
          SizedBox(height: 1.h),
          Divider(
            color: textGrey,
            thickness: 0.2.h,
            indent: 5.w,
            endIndent: 5.w,
          ),
          SizedBox(height: 2.h),
          h3Text('Refer and Earn program', textBlack),
          referalNotification(),
          SizedBox(height: 2.h),
          couponButton(),
          SizedBox(height: 2.h),
          inviteButton(),
          SizedBox(height: 1.h),
          h5Text('How do refer and earn work?'.toUpperCase(), textBlack),
          referalMap()
        ],
      ),
    );
  }
}

Widget inviteButton() {
  return ElevatedButton(
    style: ButtonStyle(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(
            color: primaryColor2,
            width: 0.2.h,
          ),
        ),
      ),
    ),
    onPressed: () {},
    child: h5Text('Invite'.toUpperCase(), primaryColor2),
  );
}
