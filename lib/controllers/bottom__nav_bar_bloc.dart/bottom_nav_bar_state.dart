part of 'bottom_nav_bar_bloc.dart';

sealed class BottomNavBarState extends Equatable {
  const BottomNavBarState();
  final Widget screen = const HomeScreen();
  final String appBarTitle = 'HomePage';
  final int selectedIndex = 0;
  final IconData buttonIcon = FontAwesomeIcons.plus;
  
  @override
  List<Object> get props => [
        screen,
        appBarTitle,
        selectedIndex,
        buttonIcon,
      ];
}

final class BottomNavBarInitial extends BottomNavBarState {}

final class ScreenAndTitle extends BottomNavBarState {
  const ScreenAndTitle({
    required this.screen,
    required this.appBarTitle,
    required this.selectedIndex,
    required this.buttonIcon,
  });
  final Widget screen;
  final String appBarTitle;
  final int selectedIndex;
  final IconData buttonIcon;
}
