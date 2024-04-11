import 'package:flutter/material.dart';
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
          icon: Image.asset(_isOngoing
              ? 'assets/icons/ongoing_enabled.png'
              : 'assets/icons/ongoing_disabled.png'),
          label: h4Text('Ongoing', _isOngoing ? Colors.white : primaryColor2),
          style: ElevatedButton.styleFrom(
            foregroundColor: _isOngoing ? Colors.white : primaryColor2,
            backgroundColor: _isOngoing ? primaryColor2 : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor2,
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
          icon: Image.asset(_isOngoing
              ? 'assets/icons/previous_disabled.png'
              : 'assets/icons/previous_enabled.png'),
          label: h4Text('Previous', _isOngoing ? primaryColor2 : Colors.white),
          style: ElevatedButton.styleFrom(
            foregroundColor: _isOngoing ? primaryColor2 : Colors.white,
            backgroundColor: _isOngoing ? Colors.white : primaryColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor2,
                width: 0.2.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
