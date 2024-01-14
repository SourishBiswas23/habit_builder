import 'package:flutter/material.dart';

import '../community_screen/community_screen.dart';
import '../courses_screen/courses_screen.dart';
import '../home_screen/home_screen.dart';
import '../settings_screen/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CoursesScreen(),
    const CommunityScreen(),
    const SettingsScreen(),
  ];

  final List<String> _labels = [
    'home',
    'courses',
    'community',
    'settings',
  ];

  final List<String> _selectedIconPath = [
    'assets/images/home_selected.png',
    'assets/images/courses_selected.png',
    'assets/images/community_selected.png',
    'assets/images/settings_selected.png',
  ];
  final List<String> _unSelectedIconPath = [
    'assets/images/home_un_selected.png',
    'assets/images/courses_un_selected.png',
    'assets/images/community_un_selected.png',
    'assets/images/settings_un_selected.png',
  ];

  final List<String> appbarTitles = [
    'HomePage ',
    'Courses',
    'Community',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appbarTitles[_selectedIndex],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: ClipPath(
        clipper: CurvedBottomNavigationBarClipper(),
        child: BottomNavigationBar(
          iconSize: 5,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: List.generate(_screens.length, (index) {
            return BottomNavigationBarItem(
              label: _labels[index],
              icon: index == _selectedIndex
                  ? Image.asset(
                      _selectedIconPath[index],
                      fit: BoxFit.cover,
                      height: 30,
                      width: 30,
                    )
                  : Image.asset(
                      _unSelectedIconPath[index],
                      fit: BoxFit.cover,
                      height: 30,
                      width: 30,
                    ),
            );
          }),
        ),
      ),
    );
  }
}

class CurvedBottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2900048, 0);
    path.cubicTo(
      size.width * 0.3326232,
      0,
      size.width * 0.3744831,
      size.height * 0.05835450,
      size.width * 0.4113357,
      size.height * 0.1691400,
    );
    path.lineTo(size.width * 0.4558961, size.height * 0.3031000);
    path.cubicTo(
      size.width * 0.4835531,
      size.height * 0.3862437,
      size.width * 0.5176884,
      size.height * 0.3865613,
      size.width * 0.5454034,
      size.height * 0.3039287,
    );
    path.lineTo(
      size.width * 0.5913647,
      size.height * 0.1668975,
    );
    path.cubicTo(
      size.width * 0.6280386,
      size.height * 0.05755412,
      size.width * 0.6696208,
      0,
      size.width * 0.7119469,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
