import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'Screens/Navbar/MenuBody.dart';
import 'Screens/Navbar/homeBody.dart';
import 'Screens/Navbar/orderBody.dart';
import 'Screens/Navbar/walletBody.dart';

import 'Widgets/constants/colors.dart';
import 'Widgets/constants/texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeBody(),
    const MenuBody(),
    const OrderBody(),
    const WalletBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: body4TextStyle.copyWith(color: primaryColor),
        unselectedLabelStyle: body4TextStyle.copyWith(color: textGrey2),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              color: _selectedIndex == 0 ? primaryColor : textGrey2,
              height: 3.5.h,
              width: 3.5.h,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/menu_icon.svg',
              color: _selectedIndex == 1 ? primaryColor : textGrey2,
              height: 3.5.h,
              width: 3.5.h,
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/order_icon.svg',
              color: _selectedIndex == 2 ? primaryColor : textGrey2,
              height: 3.5.h,
              width: 3.5.h,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/wallet_icon.svg',
              color: _selectedIndex == 3 ? primaryColor : textGrey2,
              height: 3.5.h,
              width: 3.5.h,
            ),
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: primaryColor,
        unselectedItemColor: textGrey2,
        onTap: _onItemTapped,
      ),
    );
  }
}
