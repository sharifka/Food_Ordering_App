import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/screens.dart';

class MainPage extends StatefulWidget {
  static const String id = 'MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    HomScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.yellow,
        iconSize: 30,
        //selectedFontSize: 25,
        // unselectedFontSize: 16,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
            //  backgroundColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
