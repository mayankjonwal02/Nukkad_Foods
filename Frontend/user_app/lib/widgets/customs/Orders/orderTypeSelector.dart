import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';

class OrderTypeSelector extends StatefulWidget {
  final Function(bool) onOrderTypeChanged;

  OrderTypeSelector({Key? key, required this.onOrderTypeChanged})
      : super(key: key);

  @override
  _OrderTypeSelectorState createState() => _OrderTypeSelectorState();
}

class _OrderTypeSelectorState extends State<OrderTypeSelector> {
  bool _isOngoing = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _isOngoing = !_isOngoing;
            });
            widget.onOrderTypeChanged(_isOngoing);
          },
          icon: SvgPicture.asset('assets/icons/ongoing_orders_icon.svg',height: 4.h,
          color: _isOngoing ? Colors.white : primaryColor,),
          label: Text('Ongoing', style: h4TextStyle.copyWith(color: _isOngoing ? Colors.white : primaryColor)),
          style: ElevatedButton.styleFrom(
            foregroundColor: _isOngoing ? Colors.white : primaryColor,
            backgroundColor: _isOngoing ? primaryColor : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 0.2.h,
              ),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _isOngoing = !_isOngoing;
            });
            widget.onOrderTypeChanged(_isOngoing);
          },
          icon: SvgPicture.asset('assets/icons/previous_orders_icon.svg', height: 3.h,
          color: _isOngoing ? primaryColor : Colors.white,),
          label: Text('Previous', style: h4TextStyle.copyWith(color: _isOngoing ? primaryColor : Colors.white)),
          style: ElevatedButton.styleFrom(
            foregroundColor: _isOngoing ? primaryColor : Colors.white,
            backgroundColor: _isOngoing ? Colors.white : primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 0.2.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
