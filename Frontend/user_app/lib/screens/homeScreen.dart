import 'package:flutter/material.dart';
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
        child: Container(
          margin: EdgeInsets.fromLTRB(3.w, 5.h, 2.w, 0),
          child: _widgetOptions[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: primaryColor2,
        unselectedItemColor: textGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
