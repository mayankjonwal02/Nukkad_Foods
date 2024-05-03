import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../constants/texts.dart';

class SortingBar extends StatefulWidget {
  final bool type;
  const SortingBar({Key? key, required this.type}) : super(key: key);

  @override
  State<SortingBar> createState() => _SortingBarState();
}

class _SortingBarState extends State<SortingBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.type ? 'Ongoing Orders' : 'Previous Orders',
          style: h3TextStyle.copyWith(color: textBlack),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor, width: 0.2.h),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/sorting_icon.svg'),
              SizedBox(width: 1.w),
              Text(
                'Sort',
                style: body3TextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
