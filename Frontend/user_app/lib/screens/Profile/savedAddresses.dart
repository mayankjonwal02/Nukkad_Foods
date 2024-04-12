import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Widgets/constants/colors.dart';
import 'package:user_app/Widgets/constants/texts.dart';
import 'package:user_app/Widgets/customs/Profile/addressCard.dart';

class SavedAddresses extends StatefulWidget {
  const SavedAddresses({super.key});

  @override
  State<SavedAddresses> createState() => _SavedAddressesState();
}

class _SavedAddressesState extends State<SavedAddresses> {
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
        title: h4Text('Saved Addresses', textBlack),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            addressCard('assets/icons/home_address_icon.svg', 'Home',
                '489, Near Shakuntala Devi Hospital, Chameli Park, Goyal Nagar, Indore, Madhya Pradesh, India'),
            addressCard('assets/icons/work_address_icon.svg', 'Work',
                '489, Near Shakuntala Devi Hospital, Chameli Park, Goyal Nagar, Indore, Madhya Pradesh, India'),
          ],
        ),
      ),
    );
  }
}
