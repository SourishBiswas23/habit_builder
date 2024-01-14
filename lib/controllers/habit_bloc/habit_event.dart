part of 'habit_bloc.dart';

sealed class HabitEvent extends Equatable {
  const HabitEvent();

  @override
  List<Object> get props => [];
}

final class UpdateTimeEvent extends HabitEvent {
  const UpdateTimeEvent({required this.time});
  final String time;
}
