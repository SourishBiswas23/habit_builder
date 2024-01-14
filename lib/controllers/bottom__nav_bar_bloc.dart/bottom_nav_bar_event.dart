part of 'bottom_nav_bar_bloc.dart';

sealed class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();
  final int index = 0;

  @override
  List<Object> get props => [
        index,
      ];
}

final class LoadHomeScreenEvent extends BottomNavBarEvent {
  const LoadHomeScreenEvent({required this.index});
  final int index;
}

final class LoadCommunityScreenEvent extends BottomNavBarEvent {
  const LoadCommunityScreenEvent({required this.index});
  final int index;
}

final class LoadCoursesScreenEvent extends BottomNavBarEvent {
  const LoadCoursesScreenEvent({required this.index});
  final int index;
}

final class LoadSettingsScreenEvent extends BottomNavBarEvent {
  const LoadSettingsScreenEvent({required this.index});
  final int index;
}

final class LoadNewHabitScreenEvent extends BottomNavBarEvent {
  const LoadNewHabitScreenEvent({required this.index});
  final int index;
}
