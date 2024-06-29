import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/Support/chatSupportScreen.dart';
import 'package:user_app/widgets/buttons/mainButton.dart';
import 'package:user_app/widgets/constants/colors.dart';
import 'package:user_app/widgets/constants/texts.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  routeChat() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatSupportScreen(),
      ),
    );
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
        title: Text('Help & Support', style: h4TextStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              const ExpandableBox(
                titleText: 'I want to cancel my order',
                contentText:
                    'In order to cancel your order, please click on "Help" and then "I want to cancel my order". Please note that we may charge you a cancellation fee as it helps us to minimise food wastage and also compensate our restaurant partners for cancelled orders.',
              ),
              const ExpandableBox(
                titleText: 'Can I edit my order?',
                contentText:
                    'In order to cancel your order, please click on "Help" and then "I want to cancel my order". Please note that we may charge you a cancellation fee as it helps us to minimise food wastage and also compensate our restaurant partners for cancelled orders.',
              ),
              const ExpandableBox(
                titleText: 'What are your delivery hours?',
                contentText:
                    'In order to cancel your order, please click on "Help" and then "I want to cancel my order". Please note that we may charge you a cancellation fee as it helps us to minimise food wastage and also compensate our restaurant partners for cancelled orders.',
              ),
              const ExpandableBox(
                titleText: 'Can I order from any location?',
                contentText:
                    'In order to cancel your order, please click on "Help" and then "I want to cancel my order". Please note that we may charge you a cancellation fee as it helps us to minimise food wastage and also compensate our restaurant partners for cancelled orders.',
              ),
              const ExpandableBox(
                titleText: 'Can I order in advance?',
                contentText:
                    'In order to cancel your order, please click on "Help" and then "I want to cancel my order". Please note that we may charge you a cancellation fee as it helps us to minimise food wastage and also compensate our restaurant partners for cancelled orders.',
              ),
              const ExpandableBox(
                titleText: 'Can I change the address?',
                contentText:
                    'In order to cancel your order, please click on "Help" and then "I want to cancel my order". Please note that we may charge you a cancellation fee as it helps us to minimise food wastage and also compensate our restaurant partners for cancelled orders.',
              ),
              const ExpandableBox(
                titleText: 'Did not receive referral coupon?',
                contentText:
                    'In order to cancel your order, please click on "Help" and then "I want to cancel my order". Please note that we may charge you a cancellation fee as it helps us to minimise food wastage and also compensate our restaurant partners for cancelled orders.',
              ),
              SizedBox(height: 5.h),
              Text('Still need help?',
                  style: h6TextStyle.copyWith(color: primaryColor)),
              SizedBox(height: 4.h),
              mainButton('chat with us', Colors.white, routeChat)
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableBox extends StatefulWidget {
  final String titleText;
  final String contentText;

  const ExpandableBox({
    super.key,
    required this.titleText,
    required this.contentText,
  });

  @override
  _ExpandableBoxState createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox> {
  bool _isExpanded = false;
  double _boxHeight = 7.5.h;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _boxHeight = _isExpanded ? 18.h : 7.h;
    });
  }

  final iconExpand = Icon(
    Icons.keyboard_arrow_down_rounded,
    color: Colors.black,
    size: 22.sp,
  );

  final iconCollapse = Icon(
    Icons.keyboard_arrow_up_rounded,
    color: Colors.black,
    size: 22.sp,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          height: _boxHeight,
          decoration: BoxDecoration(
            color: const Color(0xFFfafafa),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 0.1.h),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      widget.titleText,
                      style: body3TextStyle.copyWith(fontSize: 14.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  IconButton(
                    icon: _isExpanded ? iconCollapse : iconExpand,
                    onPressed: _toggleExpand,
                  ),
                ],
              ),
              if (_isExpanded)
                Expanded(
                  child: Text(widget.contentText, style: body6TextStyle),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
