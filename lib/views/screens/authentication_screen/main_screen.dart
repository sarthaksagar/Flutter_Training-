import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/nev_screens/account_scree.dart';
import 'package:flutter_application_1/views/screens/nev_screens/cart_screen.dart';
import 'package:flutter_application_1/views/screens/nev_screens/favorite_screen.dart';
import 'package:flutter_application_1/views/screens/nev_screens/home_screen.dart';
import 'package:flutter_application_1/views/screens/nev_screens/stores_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    FavoriteScreen(),
    StoresScreen(),
    AccountScree(),
    CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home.png", width: 25),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/love.png", width: 25),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/mart.png", width: 25),
            label: "Stores",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/cart.png", width: 25),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/user.png", width: 25),
            label: "Account",
          ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
