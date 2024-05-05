import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/customs/WalletBody/couponButton.dart';
import '../../Widgets/customs/WalletBody/inviteButton.dart';
import '../../Widgets/customs/WalletBody/referalMap.dart';
import '../../Widgets/customs/WalletBody/referalNotification.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({super.key});

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Refer and Earn program', style: h3TextStyle),
            referalNotification(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: couponButton(),
            ),
            inviteButton(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Text(
                'How do refer and earn work?'.toUpperCase(),
                style: body3TextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            referalMap()
          ],
        ),
      ),
    );
  }
}
