import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

class TrackRiderScreen extends StatefulWidget {
  const TrackRiderScreen({super.key});

  @override
  State<TrackRiderScreen> createState() => _TrackRiderScreenState();
}

class _TrackRiderScreenState extends State<TrackRiderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Rider', style: h4TextStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 19.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}