part of 'habit_bloc.dart';

sealed class HabitState extends Equatable {
  const HabitState();
  final String time = '10:00';

  @override
  List<Object> get props => [time];
}

final class HabitInitial extends HabitState {}

final class HabitTime extends HabitState {
  const HabitTime({required this.time});
  final String time;
}
