import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:user_app/Screens/NavBarWidgets/foodBody.dart';
import 'package:user_app/Screens/NavBarWidgets/orderBody.dart';
import 'package:user_app/Screens/NavBarWidgets/profileBody.dart';
import 'package:user_app/Screens/NavBarWidgets/walletBody.dart';
import 'package:user_app/Widgets/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const FoodBody(),
    const OrdersBody(),
    const WalletBody(),
    const ProfileBody()
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/food_home_icon.svg',
              color: _selectedIndex == 0 ? primaryColor : textGrey2,
              height: 4.h,
              width: 4.h,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/orders_icon.svg',
              color: _selectedIndex == 1 ? primaryColor : textGrey2,
              height: 4.h,
              width: 4.h,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/wallet_icon.svg',
              color: _selectedIndex == 2 ? primaryColor : textGrey2,
              height: 4.h,
              width: 4.h,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              color: _selectedIndex == 3 ? primaryColor : textGrey2,
              height: 4.h,
              width: 4.h,
            ),
            label: 'Profile',
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
