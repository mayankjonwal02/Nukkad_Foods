import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
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
          Text('Refer and Earn program', style: h3TextStyle),
          referalNotification(),
          SizedBox(height: 2.h),
          couponButton(),
          SizedBox(height: 4.h),
          inviteButton(),
          SizedBox(height: 2.h),
          Text(
            'How do refer and earn work?'.toUpperCase(),
            style: body3TextStyle.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 2.h),
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
            color: primaryColor,
            width: 0.2.h,
          ),
        ),
      ),
    ),
    onPressed: () {},
    child: Text(
      'Invite'.toUpperCase(),
      style: body3TextStyle.copyWith(
          fontWeight: FontWeight.w300, color: primaryColor),
    ),
  );
}
