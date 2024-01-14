import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_builder/app_theme.dart';

import '../../controllers/bottom__nav_bar_bloc.dart/bottom_nav_bar_bloc.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List _events = [
    const LoadHomeScreenEvent(index: 0),
    const LoadCoursesScreenEvent(index: 1),
    const LoadCommunityScreenEvent(index: 2),
    const LoadSettingsScreenEvent(index: 3),
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
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.appBarTitle,
            ),
          ),
          body: state.screen,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () => context.read<BottomNavBarBloc>().add(
                    LoadNewHabitScreenEvent(index: state.selectedIndex),
                  ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFC9D45),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(
                            0.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.morning,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 60,
                          color: Color(0xFFD07E32),
                        )
                      ],
                    ),
                    child: Center(
                      child: FaIcon(
                        state.buttonIcon,
                        color: AppTheme.eclipse,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: ClipPath(
            clipper: CurvedBottomNavigationBarClipper(),
            child: BottomNavigationBar(
              iconSize: 5,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: state.selectedIndex,
              onTap: (value) {
                context.read<BottomNavBarBloc>().add(_events[value]);
              },
              items: List.generate(_events.length, (index) {
                return BottomNavigationBarItem(
                  label: _labels[index],
                  icon: index == state.selectedIndex
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
      },
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
