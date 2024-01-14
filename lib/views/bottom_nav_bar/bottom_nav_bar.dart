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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appbar,
      body: _screens[_selectedIndex],
      bottomNavigationBar: ClipPath(
        // clipper: CurvedBottomNavigationBarClipper(),
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
    final path = Path();
    path.moveTo(0, size.height);

    path.lineTo(size.width, size.height);
    path.cubicTo(
      size.width * 0.35,
      size.height,
      size.width * 0.41,
      size.height * 0.75,
      size.width * 0.45,
      size.height * 0.65,
    );
    path.cubicTo(
      size.width * 0.49,
      size.height * 0.55,
      size.width * 0.55,
      size.height * 0.55,
      size.width * 0.59,
      size.height * 0.65,
    );
    path.cubicTo(
      size.width * 0.63,
      size.height * 0.75,
      size.width * 0.69,
      size.height,
      size.width * 0.71,
      size.height,
    );

    path.lineTo(
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
