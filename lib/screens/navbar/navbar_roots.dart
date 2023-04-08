import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './navbar.dart';

class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  // Var Section....................................
  int _selectedIndex = 0;
  final _screens = [
    const HomeScreen(),
    const PromotionScreen(),
    AboutScreen(),
    const ScheduleScreen(),
    //BookingScreen(),
  ];
  // End Var Section....................................
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _bottomNavigationBar() {
    return SizedBox(
      height: 60,
      //height: 80,
      child: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.bgPurple,
        unselectedItemColor: Colors.black26,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        // required param
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bookmark_fill),
            label: "Promotion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appoinment",
          ),
        ],
      ),
    );
  }
}
