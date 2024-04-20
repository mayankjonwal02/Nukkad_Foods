import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class OrderTypeSelector extends StatefulWidget {
  final Function(bool) onOrderTypeChanged;
  const OrderTypeSelector({Key? key, required this.onOrderTypeChanged})
      : super(key: key);

  @override
  State<OrderTypeSelector> createState() => _OrderTypeSelectorState();
}

class _OrderTypeSelectorState extends State<OrderTypeSelector> {
  bool _isDelivery = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isDelivery = true;
                });
                widget.onOrderTypeChanged(_isDelivery);
              },
              icon: SvgPicture.asset(
                'assets/icons/delivering_icon.svg',
                height: 3.h,
                color: _isDelivery ? Colors.white : primaryColor,
              ),
              label: Text(
                'Delivery',
                style: h5TextStyle.copyWith(
                    color: _isDelivery ? Colors.white : primaryColor),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: _isDelivery ? Colors.white : primaryColor,
                backgroundColor: _isDelivery ? primaryColor : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  side: BorderSide(
                    color: primaryColor,
                    width: 0.2.h,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 1.w),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isDelivery = false;
                });
                widget.onOrderTypeChanged(_isDelivery);
              },
              icon: SvgPicture.asset(
                'assets/icons/takeaway_icon.svg',
                height: 3.h,
                color: _isDelivery ? primaryColor : Colors.white,
              ),
              label: Text(
                'Take Away',
                style: h5TextStyle.copyWith(
                    color: _isDelivery ? primaryColor : Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: _isDelivery ? primaryColor : Colors.white,
                backgroundColor: _isDelivery ? Colors.white : primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  side: BorderSide(
                    color: primaryColor,
                    width: 0.2.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
