import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

Widget WalletCash(bool? useWalletMoney, void Function(bool?) onChanged) {
  return CheckboxListTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 50.w,
          child: Text(
            'Use Wallet Cash',
            style: h5TextStyle.copyWith(
              color: textBlack,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          width: 25.w,
          child: Text(
            '₹27.85',
            style: h5TextStyle.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ),
    value: useWalletMoney ?? false,
    onChanged: onChanged,
    activeColor: primaryColor,
    controlAffinity: ListTileControlAffinity.leading,
  );
}
