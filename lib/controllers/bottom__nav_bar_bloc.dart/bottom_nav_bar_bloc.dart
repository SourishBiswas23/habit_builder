import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../views/community_screen/community_screen.dart';
import '../../views/courses_screen/courses_screen.dart';
import '../../views/home_screen/home_screen.dart';
import '../../views/new_habit_screen/new_habit_screen.dart';
import '../../views/settings_screen/settings_screen.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<LoadHomeScreenEvent>((event, emit) {
      emit(
        ScreenAndTitle(
          screen: const HomeScreen(),
          appBarTitle: 'HomePage',
          selectedIndex: event.index,
          buttonIcon: FontAwesomeIcons.plus,
        ),
      );
    });
    on<LoadCommunityScreenEvent>((event, emit) {
      emit(
        ScreenAndTitle(
          screen: const CommunityScreen(),
          appBarTitle: 'Community',
          selectedIndex: event.index,
          buttonIcon: FontAwesomeIcons.plus,
        ),
      );
    });
    on<LoadCoursesScreenEvent>((event, emit) {
      emit(
        ScreenAndTitle(
          screen: const CoursesScreen(),
          appBarTitle: 'Courses',
          selectedIndex: event.index,
          buttonIcon: FontAwesomeIcons.plus,
        ),
      );
    });
    on<LoadSettingsScreenEvent>((event, emit) {
      emit(
        ScreenAndTitle(
          screen: const SettingsScreen(),
          appBarTitle: 'Settings',
          selectedIndex: event.index,
          buttonIcon: FontAwesomeIcons.plus,
        ),
      );
    });
    on<LoadNewHabitScreenEvent>((event, emit) {
      emit(
        ScreenAndTitle(
          screen: const NewHabitScreen(),
          appBarTitle: 'New Habit',
          selectedIndex: event.index,
          buttonIcon: FontAwesomeIcons.check,
        ),
      );
    });
  }
}
